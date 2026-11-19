using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Velora.Core.Models;
namespace Velora.Core.Pages.Account;
public sealed class LogoutModel(SignInManager<ApplicationUser> signIn):PageModel{public async Task<IActionResult> OnPostAsync(){await signIn.SignOutAsync();return RedirectToPage("/Index");}}
