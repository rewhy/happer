.class public final Landroid/support/v4/database/sqlite/SQLiteCursorCompat;
.super Ljava/lang/Object;
.source "SQLiteCursorCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setFillWindowForwardOnly(Landroid/database/sqlite/SQLiteCursor;Z)V
    .registers 4
    .param p0    # Landroid/database/sqlite/SQLiteCursor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_9

    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteCursor;->setFillWindowForwardOnly(Z)V

    :cond_9
    return-void
.end method
