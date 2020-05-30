import sublime
import sublime_plugin
import os


class RelatedFilesCommand(sublime_plugin.WindowCommand):
    def run(self):
        current_file = self.window.active_view().file_name()
        current_dir = os.path.dirname(current_file)
        projects = self.window.project_data()["folders"]
        for project in projects:
            if current_dir.startswith(project["path"]):
                project_adjusted_dir = current_dir[len(project["path"])+1:] + "/"
                break

        self.window.run_command("show_overlay", {"overlay": "goto", "show_files": True, "text": project_adjusted_dir})
