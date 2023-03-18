using Microsoft.AspNetCore.Mvc;

namespace SampleApi.Controllers;

[ApiController]
[Route("[controller]")]
public class PersonController : ControllerBase
{

    private readonly ILogger<PersonController> _logger;

    public PersonController(ILogger<PersonController> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public IActionResult Get()
    {
        var persons = new string[]{
            "Ahmed",
            "Mohamed",
            "Spider Man"
        };
        return Ok(persons);
    }
}
