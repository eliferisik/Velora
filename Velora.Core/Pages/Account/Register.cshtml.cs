using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Velora.Core.Models;

namespace Velora.Core.Pages.Account;
public sealed class RegisterModel(UserManager<ApplicationUser> users,SignInManager<ApplicationUser> signIn):PageModel
{
    [BindProperty] public InputModel Input{get;set;}=new();
    public sealed class InputModel{[Required,StringLength(120)]public string FullName{get;set;}="";[Required,EmailAddress]public string Email{get;set;}="";[Required,MinLength(8),DataType(DataType.Password)]public string Password{get;set;}="";[Compare(nameof(Password)),DataType(DataType.Password)]public string ConfirmPassword{get;set;}="";}
    public void OnGet(){}
    public async Task<IActionResult> OnPostAsync(){if(!ModelState.IsValid)return Page();var user=new ApplicationUser{UserName=Input.Email,Email=Input.Email,FullName=Input.FullName};var result=await users.CreateAsync(user,Input.Password);if(result.Succeeded){await users.AddToRoleAsync(user,"User");await signIn.SignInAsync(user,false);return RedirectToPage("/Index");}foreach(var e in result.Errors)ModelState.AddModelError(string.Empty,e.Description);return Page();}
}
