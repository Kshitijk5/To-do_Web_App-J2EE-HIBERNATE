package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "NoteEntity")
@Table(name = "note")
public class NoteEntity {
	@Id
	@Column(name="note_id")
	private int noteId;
	@Column(name="title")
	private String title;
	@Column(name="content")
	private String content;

	public NoteEntity() {
	}

	public NoteEntity(String title, String content) {
		this.title = title;
		this.content = content;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
