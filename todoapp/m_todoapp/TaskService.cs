namespace m_todoapp
{
    public class TaskService
    {
        public static List<Task> GetTasks()
        {
            return new List<Task>
            {
                new Task { Id = Guid.NewGuid(), Description = "Aprender React", IsDone = true },
                new Task { Id = Guid.NewGuid(), Description = "Explorar MVVM en Flutter", IsDone = false },
                new Task { Id = Guid.NewGuid(), Description = "Revisar pull requests", IsDone = true },
                new Task { Id = Guid.NewGuid(), Description = "Comprobar mails", IsDone = false },
            };
        }
    }
}
