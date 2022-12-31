namespace m_todoapp;

public partial class MainPage : ContentPage
{
	public MainPage()
	{
		InitializeComponent();
		var tasks = TaskService.GetTasks();
		taskList.ItemsSource = tasks;
	}
}

