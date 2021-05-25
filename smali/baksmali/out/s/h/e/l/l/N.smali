.class public Ls/h/e/l/l/N;
.super Ljava/lang/Object;


# static fields
.field static la:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v1, 0x0

    const/4 v0, 0x1

    sput-boolean v0, Ls/h/e/l/l/N;->la:Z

    const/4 v3, 0x0

    :try_start_5
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a} :catch_52
    .catchall {:try_start_5 .. :try_end_a} :catchall_61

    :try_start_a
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_f} :catch_8c
    .catchall {:try_start_a .. :try_end_f} :catchall_87

    if-eqz v0, :cond_14

    :try_start_11
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_14} :catch_83

    :cond_14
    :goto_14
    if-eqz v2, :cond_19

    :try_start_16
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_19} :catch_85

    :cond_19
    :goto_19
    sget-boolean v0, Ls/h/e/l/l/N;->la:Z

    if-eqz v0, :cond_6e

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Ls/h/e/l/l/S;->p:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/libexec.so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    sget-boolean v0, Ls/h/e/l/l/S;->m:Z

    if-eqz v0, :cond_51

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Ls/h/e/l/l/S;->p:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/libexecmain.so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    :cond_51
    :goto_51
    return-void

    :catch_52
    move-exception v0

    move-object v0, v1

    :goto_54
    if-eqz v0, :cond_59

    :try_start_56
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_59} :catch_7d

    :cond_59
    :goto_59
    if-eqz v1, :cond_19

    :try_start_5b
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_5e} :catch_5f

    goto :goto_19

    :catch_5f
    move-exception v0

    goto :goto_19

    :catchall_61
    move-exception v0

    move-object v2, v1

    :goto_63
    if-eqz v2, :cond_68

    :try_start_65
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_68} :catch_7f

    :cond_68
    :goto_68
    if-eqz v1, :cond_6d

    :try_start_6a
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_6d} :catch_81

    :cond_6d
    :goto_6d
    throw v0

    :cond_6e
    const-string v0, "exec"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    sget-boolean v0, Ls/h/e/l/l/S;->m:Z

    if-eqz v0, :cond_51

    const-string v0, "execmain"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_51

    :catch_7d
    move-exception v0

    goto :goto_59

    :catch_7f
    move-exception v2

    goto :goto_68

    :catch_81
    move-exception v1

    goto :goto_6d

    :catch_83
    move-exception v0

    goto :goto_14

    :catch_85
    move-exception v0

    goto :goto_19

    :catchall_87
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    goto :goto_63

    :catch_8c
    move-exception v2

    goto :goto_54
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native b2b([BI)[B
.end method

.method public static native l(Landroid/app/Application;Ljava/lang/String;)Z
.end method

.method public static native m(Ljava/lang/String;I)V
.end method

.method public static native r(Landroid/app/Application;Ljava/lang/String;)Z
.end method

.method public static native ra(Landroid/app/Application;Ljava/lang/String;)Z
.end method

.method public static native sa(Ljava/lang/String;Ljava/lang/String;)V
.end method
