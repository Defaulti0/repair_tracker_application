import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientInstance {
  static final SupabaseClient _instance = SupabaseClient(
    'https://novdxmvytymxsrxxifcl.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vdmR4bXZ5dHlteHNyeHhpZmNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2ODk0NjQsImV4cCI6MjAyMzI2NTQ2NH0.-nbWSqTM6_DdbPbhXqRsmUsoIzDnpmn5H42sklNSIJ0',
  );

  static SupabaseClient get instance => _instance;
}