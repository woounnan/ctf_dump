.class public Landroid/support/design/widget/BottomSheetBehavior;
.super Landroid/support/design/widget/CoordinatorLayout$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/BottomSheetBehavior$b;,
        Landroid/support/design/widget/BottomSheetBehavior$c;,
        Landroid/support/design/widget/BottomSheetBehavior$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroid/support/design/widget/CoordinatorLayout$a",
        "<TV;>;"
    }
.end annotation


# instance fields
.field a:I

.field b:I

.field c:Z

.field d:I

.field e:Landroid/support/v4/widget/n;

.field f:I

.field g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<TV;>;"
        }
    .end annotation
.end field

.field h:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field i:I

.field j:Z

.field private k:F

.field private l:I

.field private m:Z

.field private n:I

.field private o:Z

.field private p:Z

.field private q:I

.field private r:Z

.field private s:Landroid/support/design/widget/BottomSheetBehavior$a;

.field private t:Landroid/view/VelocityTracker;

.field private u:I

.field private final v:Landroid/support/v4/widget/n$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout$a;-><init>()V

    const/4 v0, 0x4

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    new-instance v0, Landroid/support/design/widget/BottomSheetBehavior$1;

    invoke-direct {v0, p0}, Landroid/support/design/widget/BottomSheetBehavior$1;-><init>(Landroid/support/design/widget/BottomSheetBehavior;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->v:Landroid/support/v4/widget/n$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, -0x1

    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/CoordinatorLayout$a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x4

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    new-instance v0, Landroid/support/design/widget/BottomSheetBehavior$1;

    invoke-direct {v0, p0}, Landroid/support/design/widget/BottomSheetBehavior$1;-><init>(Landroid/support/design/widget/BottomSheetBehavior;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->v:Landroid/support/v4/widget/n$a;

    sget-object v0, Landroid/support/design/a$j;->BottomSheetBehavior_Layout:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/support/design/a$j;->BottomSheetBehavior_Layout_behavior_peekHeight:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_0

    iget v2, v1, Landroid/util/TypedValue;->data:I

    if-ne v2, v3, :cond_0

    iget v1, v1, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0, v1}, Landroid/support/design/widget/BottomSheetBehavior;->a(I)V

    :goto_0
    sget v1, Landroid/support/design/a$j;->BottomSheetBehavior_Layout_behavior_hideable:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/BottomSheetBehavior;->a(Z)V

    sget v1, Landroid/support/design/a$j;->BottomSheetBehavior_Layout_behavior_skipCollapsed:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/BottomSheetBehavior;->b(Z)V

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->k:F

    return-void

    :cond_0
    sget v1, Landroid/support/design/a$j;->BottomSheetBehavior_Layout_behavior_peekHeight:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/BottomSheetBehavior;->a(I)V

    goto :goto_0
.end method

.method private a()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->i:I

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    :cond_0
    return-void
.end method

.method private b()F
    .locals 3

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->k:F

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->i:I

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v0

    return v0
.end method


# virtual methods
.method a(Landroid/view/View;)Landroid/view/View;
    .locals 3

    invoke-static {p1}, Landroid/support/v4/i/q;->s(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p1

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    move v1, v0

    :goto_1
    if-ge v1, v2, :cond_2

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetBehavior;->a(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    move-object p1, v0

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public final a(I)V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p1, v2, :cond_1

    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->m:Z

    if-nez v2, :cond_3

    iput-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->m:Z

    :goto_0
    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->g:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->g:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    :cond_0
    return-void

    :cond_1
    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->m:Z

    if-nez v2, :cond_2

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->l:I

    if-eq v2, p1, :cond_3

    :cond_2
    iput-boolean v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->m:Z

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->l:I

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    sub-int/2addr v1, p1

    iput v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/os/Parcelable;",
            ")V"
        }
    .end annotation

    check-cast p3, Landroid/support/design/widget/BottomSheetBehavior$b;

    invoke-virtual {p3}, Landroid/support/design/widget/BottomSheetBehavior$b;->a()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, p1, p2, v0}, Landroid/support/design/widget/CoordinatorLayout$a;->a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    iget v0, p3, Landroid/support/design/widget/BottomSheetBehavior$b;->a:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p3, Landroid/support/design/widget/BottomSheetBehavior$b;->a:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x4

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    :goto_0
    return-void

    :cond_1
    iget v0, p3, Landroid/support/design/widget/BottomSheetBehavior$b;->a:I

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    goto :goto_0
.end method

.method public a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "II[I)V"
        }
    .end annotation

    const/4 v3, 0x1

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eq p3, v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    sub-int v1, v0, p5

    if-lez p5, :cond_3

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    if-ge v1, v2, :cond_2

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    sub-int/2addr v0, v1

    aput v0, p6, v3

    aget v0, p6, v3

    neg-int v0, v0

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    :cond_1
    :goto_1
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetBehavior;->c(I)V

    iput p5, p0, Landroid/support/design/widget/BottomSheetBehavior;->q:I

    iput-boolean v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->r:Z

    goto :goto_0

    :cond_2
    aput p5, p6, v3

    neg-int v0, p5

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    invoke-virtual {p0, v3}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    goto :goto_1

    :cond_3
    if-gez p5, :cond_1

    const/4 v2, -0x1

    invoke-virtual {p3, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v2

    if-nez v2, :cond_1

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    if-le v1, v2, :cond_4

    iget-boolean v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->c:Z

    if-eqz v1, :cond_5

    :cond_4
    aput p5, p6, v3

    neg-int v0, p5

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    invoke-virtual {p0, v3}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    goto :goto_1

    :cond_5
    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    sub-int/2addr v0, v1

    aput v0, p6, v3

    aget v0, p6, v3

    neg-int v0, v0

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    goto :goto_1
.end method

.method public a(Z)V
    .locals 0

    iput-boolean p1, p0, Landroid/support/design/widget/BottomSheetBehavior;->c:Z

    return-void
.end method

.method public a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;I)Z"
        }
    .end annotation

    const/4 v5, 0x1

    invoke-static {p1}, Landroid/support/v4/i/q;->n(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroid/support/v4/i/q;->n(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2, v5}, Landroid/support/v4/i/q;->a(Landroid/view/View;Z)V

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {p1, p2, p3}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;I)V

    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    iget-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->m:Z

    if-eqz v0, :cond_4

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->n:I

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Landroid/support/design/a$d;->design_bottom_sheet_peek_height_min:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->n:I

    :cond_1
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->n:I

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v3

    mul-int/lit8 v3, v3, 0x9

    div-int/lit8 v3, v3, 0x10

    sub-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_0
    const/4 v2, 0x0

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    sub-int v0, v2, v0

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_5

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    :cond_2
    :goto_1
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->v:Landroid/support/v4/widget/n$a;

    invoke-static {p1, v0}, Landroid/support/v4/widget/n;->a(Landroid/view/ViewGroup;Landroid/support/v4/widget/n$a;)Landroid/support/v4/widget/n;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->g:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0, p2}, Landroid/support/design/widget/BottomSheetBehavior;->a(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    return v5

    :cond_4
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->l:I

    goto :goto_0

    :cond_5
    iget-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->c:Z

    if-eqz v0, :cond_6

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    const/4 v2, 0x5

    if-ne v0, v2, :cond_6

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    goto :goto_1

    :cond_6
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_7

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    goto :goto_1

    :cond_7
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    if-eq v0, v5, :cond_8

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    :cond_8
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    sub-int v0, v1, v0

    invoke-static {p2, v0}, Landroid/support/v4/i/q;->c(Landroid/view/View;I)V

    goto :goto_1
.end method

.method public a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    const/4 v6, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    iput-boolean v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    :goto_0
    return v2

    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    if-nez v3, :cond_1

    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetBehavior;->a()V

    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    if-nez v0, :cond_2

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    :cond_2
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    packed-switch v3, :pswitch_data_0

    :cond_3
    :goto_1
    :pswitch_0
    iget-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    invoke-virtual {v0, p3}, Landroid/support/v4/widget/n;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_7

    move v2, v1

    goto :goto_0

    :pswitch_1
    iput-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->j:Z

    iput v6, p0, Landroid/support/design/widget/BottomSheetBehavior;->i:I

    iget-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    if-eqz v0, :cond_3

    iput-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    goto :goto_0

    :pswitch_2
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v4, v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->u:I

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_2
    if-eqz v0, :cond_4

    iget v5, p0, Landroid/support/design/widget/BottomSheetBehavior;->u:I

    invoke-virtual {p1, v0, v4, v5}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;II)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->i:I

    iput-boolean v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->j:Z

    :cond_4
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->i:I

    if-ne v0, v6, :cond_6

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->u:I

    invoke-virtual {p1, p2, v4, v0}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;II)Z

    move-result v0

    if-nez v0, :cond_6

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    goto :goto_1

    :cond_5
    const/4 v0, 0x0

    goto :goto_2

    :cond_6
    move v0, v2

    goto :goto_3

    :cond_7
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const/4 v4, 0x2

    if-ne v3, v4, :cond_8

    if-eqz v0, :cond_8

    iget-boolean v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    if-nez v3, :cond_8

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    if-eq v3, v1, :cond_8

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1, v0, v3, v4}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;II)Z

    move-result v0

    if-nez v0, :cond_8

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->u:I

    int-to-float v0, v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget-object v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    invoke-virtual {v3}, Landroid/support/v4/widget/n;->a()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_8

    :goto_4
    move v2, v1

    goto/16 :goto_0

    :cond_8
    move v1, v2

    goto :goto_4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "FF)Z"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne p3, v0, :cond_1

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    invoke-super/range {p0 .. p5}, Landroid/support/design/widget/CoordinatorLayout$a;->a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "I)Z"
        }
    .end annotation

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->q:I

    iput-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->r:Z

    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method a(Landroid/view/View;F)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->o:Z

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    if-ge v2, v3, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3dcccccd    # 0.1f

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->l:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    const/high16 v3, 0x3f000000    # 0.5f

    cmpl-float v2, v2, v3

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public b(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;)",
            "Landroid/os/Parcelable;"
        }
    .end annotation

    new-instance v0, Landroid/support/design/widget/BottomSheetBehavior$b;

    invoke-super {p0, p1, p2}, Landroid/support/design/widget/CoordinatorLayout$a;->b(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object v1

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    invoke-direct {v0, v1, v2}, Landroid/support/design/widget/BottomSheetBehavior$b;-><init>(Landroid/os/Parcelable;I)V

    return-object v0
.end method

.method b(I)V
    .locals 2

    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    if-ne v0, p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput p1, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->g:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->s:Landroid/support/design/widget/BottomSheetBehavior$a;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->s:Landroid/support/design/widget/BottomSheetBehavior$a;

    invoke-virtual {v1, v0, p1}, Landroid/support/design/widget/BottomSheetBehavior$a;->a(Landroid/view/View;I)V

    goto :goto_0
.end method

.method public b(Z)V
    .locals 0

    iput-boolean p1, p0, Landroid/support/design/widget/BottomSheetBehavior;->o:Z

    return-void
.end method

.method public b(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->d:I

    if-ne v3, v0, :cond_2

    if-eqz v2, :cond_0

    :cond_2
    iget-object v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    invoke-virtual {v3, p3}, Landroid/support/v4/widget/n;->b(Landroid/view/MotionEvent;)V

    if-nez v2, :cond_3

    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetBehavior;->a()V

    :cond_3
    iget-object v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    if-nez v3, :cond_4

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v3

    iput-object v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    :cond_4
    iget-object v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->t:Landroid/view/VelocityTracker;

    invoke-virtual {v3, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5

    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    if-nez v2, :cond_5

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->u:I

    int-to-float v2, v2

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget-object v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    invoke-virtual {v3}, Landroid/support/v4/widget/n;->a()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    iget-object v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    invoke-virtual {p3, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    invoke-virtual {v2, p2, v3}, Landroid/support/v4/widget/n;->a(Landroid/view/View;I)V

    :cond_5
    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->p:Z

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method c(I)V
    .locals 5

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->g:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->s:Landroid/support/design/widget/BottomSheetBehavior$a;

    if-eqz v1, :cond_0

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    if-le p1, v1, :cond_1

    iget-object v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->s:Landroid/support/design/widget/BottomSheetBehavior$a;

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    sub-int/2addr v2, p1

    int-to-float v2, v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    iget v4, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {v1, v0, v2}, Landroid/support/design/widget/BottomSheetBehavior$a;->a(Landroid/view/View;F)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->s:Landroid/support/design/widget/BottomSheetBehavior$a;

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    sub-int/2addr v2, p1

    int-to-float v2, v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    iget v4, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {v1, v0, v2}, Landroid/support/design/widget/BottomSheetBehavior$a;->a(Landroid/view/View;F)V

    goto :goto_0
.end method

.method public c(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    const/4 v1, 0x4

    const/4 v0, 0x3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    if-ne v2, v3, :cond_1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->h:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne p3, v2, :cond_0

    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->r:Z

    if-eqz v2, :cond_0

    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->q:I

    if-lez v2, :cond_2

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    :goto_1
    iget-object v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v2, p2, v3, v1}, Landroid/support/v4/widget/n;->a(Landroid/view/View;II)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    new-instance v1, Landroid/support/design/widget/BottomSheetBehavior$c;

    invoke-direct {v1, p0, p2, v0}, Landroid/support/design/widget/BottomSheetBehavior$c;-><init>(Landroid/support/design/widget/BottomSheetBehavior;Landroid/view/View;I)V

    invoke-static {p2, v1}, Landroid/support/v4/i/q;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    :goto_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->r:Z

    goto :goto_0

    :cond_2
    iget-boolean v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->c:Z

    if-eqz v2, :cond_3

    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetBehavior;->b()F

    move-result v2

    invoke-virtual {p0, p2, v2}, Landroid/support/design/widget/BottomSheetBehavior;->a(Landroid/view/View;F)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->f:I

    const/4 v0, 0x5

    goto :goto_1

    :cond_3
    iget v2, p0, Landroid/support/design/widget/BottomSheetBehavior;->q:I

    if-nez v2, :cond_5

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    iget v3, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    sub-int v3, v2, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget v4, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    sub-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-ge v3, v2, :cond_4

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior;->a:I

    goto :goto_1

    :cond_4
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    move v5, v1

    move v1, v0

    move v0, v5

    goto :goto_1

    :cond_5
    iget v0, p0, Landroid/support/design/widget/BottomSheetBehavior;->b:I

    move v5, v1

    move v1, v0

    move v0, v5

    goto :goto_1

    :cond_6
    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    goto :goto_2
.end method
