.class public final Landroid/support/v4/content/ContentResolverCompat;
.super Ljava/lang/Object;
.source "ContentResolverCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/support/v4/os/CancellationSignal;)Landroid/database/Cursor;
    .registers 14

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_2b

    if-eqz p6, :cond_f

    :try_start_8
    invoke-virtual {p6}, Landroid/support/v4/os/CancellationSignal;->getCancellationSignalObject()Ljava/lang/Object;

    move-result-object p6

    goto :goto_10

    :catch_d
    move-exception p0

    goto :goto_20

    :cond_f
    const/4 p6, 0x0

    :goto_10
    check-cast p6, Landroid/os/CancellationSignal;

    move-object v6, p6

    check-cast v6, Landroid/os/CancellationSignal;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1f} :catch_d

    return-object p0

    :goto_20
    instance-of p1, p0, Landroid/os/OperationCanceledException;

    if-eqz p1, :cond_2a

    new-instance p0, Landroid/support/v4/os/OperationCanceledException;

    invoke-direct {p0}, Landroid/support/v4/os/OperationCanceledException;-><init>()V

    throw p0

    :cond_2a
    throw p0

    :cond_2b
    if-eqz p6, :cond_30

    invoke-virtual {p6}, Landroid/support/v4/os/CancellationSignal;->throwIfCanceled()V

    :cond_30
    invoke-virtual/range {p0 .. p5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method
