namespace m_todoapp;

public partial class MainPage : ContentPage
{
	List<Task> tasks;
	public MainPage()
	{
		InitializeComponent();
		tasks = TaskService.GetTasks();
		taskList.ItemsSource = tasks;
	}

    private void DeleteTaskBtn_Clicked(System.Object sender, System.EventArgs e)
    {
		// Delete item from list
    }
}

