.class Landroid/support/v4/widget/TextViewCompat$OreoCallback;
.super Ljava/lang/Object;
.source "TextViewCompat.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/TextViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OreoCallback"
.end annotation


# static fields
.field private static final MENU_ITEM_ORDER_PROCESS_TEXT_INTENT_ACTIONS_START:I = 0x64


# instance fields
.field private final mCallback:Landroid/view/ActionMode$Callback;

.field private mCanUseMenuBuilderReferences:Z

.field private mInitializedMenuBuilderReferences:Z

.field private mMenuBuilderClass:Ljava/lang/Class;

.field private mMenuBuilderRemoveItemAtMethod:Ljava/lang/reflect/Method;

.field private final mTextView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ActionMode$Callback;Landroid/widget/TextView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCallback:Landroid/view/ActionMode$Callback;

    iput-object p2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mTextView:Landroid/widget/TextView;

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mInitializedMenuBuilderReferences:Z

    return-void
.end method

.method private createProcessTextIntent()Landroid/content/Intent;
    .registers 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private createProcessTextIntentForResolveInfo(Landroid/content/pm/ResolveInfo;Landroid/widget/TextView;)Landroid/content/Intent;
    .registers 5

    invoke-direct {p0}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->createProcessTextIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.PROCESS_TEXT_READONLY"

    invoke-direct {p0, p2}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->isEditable(Landroid/widget/TextView;)Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p2

    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    return-object p1
.end method

.method private getSupportedActivities(Landroid/content/Context;Landroid/content/pm/PackageManager;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/pm/PackageManager;",
            ")",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    instance-of v1, p1, Landroid/app/Activity;

    if-nez v1, :cond_a

    return-object v0

    :cond_a
    invoke-direct {p0}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->createProcessTextIntent()Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_17
    :goto_17
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    invoke-direct {p0, v1, p1}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->isSupportedActivity(Landroid/content/pm/ResolveInfo;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_2d
    return-object v0
.end method

.method private isEditable(Landroid/widget/TextView;)Z
    .registers 3

    instance-of v0, p1, Landroid/text/Editable;

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Landroid/widget/TextView;->onCheckIsTextEditor()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Landroid/widget/TextView;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_12

    const/4 p1, 0x1

    goto :goto_13

    :cond_12
    const/4 p1, 0x0

    :goto_13
    return p1
.end method

.method private isSupportedActivity(Landroid/content/pm/ResolveInfo;Landroid/content/Context;)Z
    .registers 6

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_10

    return v1

    :cond_10
    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-boolean v0, v0, Landroid/content/pm/ActivityInfo;->exported:Z

    const/4 v2, 0x0

    if-nez v0, :cond_18

    return v2

    :cond_18
    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->permission:Ljava/lang/String;

    if-eqz v0, :cond_2a

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->permission:Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v1, 0x0

    :cond_2a
    :goto_2a
    return v1
.end method

.method private recomputeProcessTextMenuItems(Landroid/view/Menu;)V
    .registers 10

    iget-object v0, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-boolean v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mInitializedMenuBuilderReferences:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_34

    iput-boolean v4, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mInitializedMenuBuilderReferences:Z

    :try_start_12
    const-string v2, "com.android.internal.view.menu.MenuBuilder"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderClass:Ljava/lang/Class;

    iget-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderClass:Ljava/lang/Class;

    const-string v5, "removeItemAt"

    new-array v6, v4, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    invoke-virtual {v2, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderRemoveItemAtMethod:Ljava/lang/reflect/Method;

    iput-boolean v4, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCanUseMenuBuilderReferences:Z
    :try_end_2c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_12 .. :try_end_2c} :catch_2d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_12 .. :try_end_2c} :catch_2d

    goto :goto_34

    :catch_2d
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderClass:Ljava/lang/Class;

    iput-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderRemoveItemAtMethod:Ljava/lang/reflect/Method;

    iput-boolean v3, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCanUseMenuBuilderReferences:Z

    :cond_34
    :goto_34
    :try_start_34
    iget-boolean v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCanUseMenuBuilderReferences:Z

    if-eqz v2, :cond_43

    iget-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderClass:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    iget-object v2, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mMenuBuilderRemoveItemAtMethod:Ljava/lang/reflect/Method;

    goto :goto_53

    :cond_43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "removeItemAt"

    new-array v6, v4, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    invoke-virtual {v2, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    :goto_53
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v5

    sub-int/2addr v5, v4

    :goto_58
    if-ltz v5, :cond_82

    invoke-interface {p1, v5}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v7

    if-eqz v7, :cond_7f

    const-string v7, "android.intent.action.PROCESS_TEXT"

    invoke-interface {v6}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7f

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-virtual {v2, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_34 .. :try_end_7f} :catch_ae
    .catch Ljava/lang/IllegalAccessException; {:try_start_34 .. :try_end_7f} :catch_ae
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_34 .. :try_end_7f} :catch_ae

    :cond_7f
    add-int/lit8 v5, v5, -0x1

    goto :goto_58

    :cond_82
    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->getSupportedActivities(Landroid/content/Context;Landroid/content/pm/PackageManager;)Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x0

    :goto_87
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_ad

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    add-int/lit8 v6, v2, 0x64

    invoke-virtual {v5, v1}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {p1, v3, v3, v6, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    iget-object v7, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mTextView:Landroid/widget/TextView;

    invoke-direct {p0, v5, v7}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->createProcessTextIntentForResolveInfo(Landroid/content/pm/ResolveInfo;Landroid/widget/TextView;)Landroid/content/Intent;

    move-result-object v5

    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_87

    :cond_ad
    return-void

    :catch_ae
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCallback:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/ActionMode$Callback;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCallback:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/ActionMode$Callback;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCallback:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 4

    invoke-direct {p0, p2}, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->recomputeProcessTextMenuItems(Landroid/view/Menu;)V

    iget-object v0, p0, Landroid/support/v4/widget/TextViewCompat$OreoCallback;->mCallback:Landroid/view/ActionMode$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method
