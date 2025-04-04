@GetMapping("/company/dashboard/dashboard")
public String dashboard(Model model) {
    model.addAttribute("currentName", "대시보드");
    model.addAttribute("smallCurrentName","대시보드");
    return "company/dashboard/dashboard";
}