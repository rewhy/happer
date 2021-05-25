.class public final Landroid/support/v13/view/inputmethod/EditorInfoCompat;
.super Ljava/lang/Object;
.source "EditorInfoCompat.java"


# static fields
.field private static final CONTENT_MIME_TYPES_KEY:Ljava/lang/String; = "android.support.v13.view.inputmethod.EditorInfoCompat.CONTENT_MIME_TYPES"

.field private static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field public static final IME_FLAG_FORCE_ASCII:I = -0x80000000

.field public static final IME_FLAG_NO_PERSONALIZED_LEARNING:I = 0x1000000


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Landroid/support/v13/view/inputmethod/EditorInfoCompat;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContentMimeTypes(Landroid/view/inputmethod/EditorInfo;)[Ljava/lang/String;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-lt v0, v1, :cond_e

    iget-object p0, p0, Landroid/view/inputmethod/EditorInfo;->contentMimeTypes:[Ljava/lang/String;

    if-eqz p0, :cond_b

    goto :goto_d

    :cond_b
    sget-object p0, Landroid/support/v13/view/inputmethod/EditorInfoCompat;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    :goto_d
    return-object p0

    :cond_e
    iget-object v0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    if-nez v0, :cond_15

    sget-object p0, Landroid/support/v13/view/inputmethod/EditorInfoCompat;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-object p0

    :cond_15
    iget-object p0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    const-string v0, "android.support.v13.view.inputmethod.EditorInfoCompat.CONTENT_MIME_TYPES"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_20

    goto :goto_22

    :cond_20
    sget-object p0, Landroid/support/v13/view/inputmethod/EditorInfoCompat;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    :goto_22
    return-object p0
.end method

.method public static setContentMimeTypes(Landroid/view/inputmethod/EditorInfo;[Ljava/lang/String;)V
    .registers 4
    .param p0    # Landroid/view/inputmethod/EditorInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-lt v0, v1, :cond_9

    iput-object p1, p0, Landroid/view/inputmethod/EditorInfo;->contentMimeTypes:[Ljava/lang/String;

    goto :goto_1b

    :cond_9
    iget-object v0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    if-nez v0, :cond_14

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    :cond_14
    iget-object p0, p0, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    const-string v0, "android.support.v13.view.inputmethod.EditorInfoCompat.CONTENT_MIME_TYPES"

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    :goto_1b
    return-void
.end method
