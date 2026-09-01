Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0337646E
	for <mfd@lists.linux.dev>; Tue,  1 Sep 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291164; cv=none; b=TtbikImqUoVpinILYVc98MoQ0RadOK+HXvtItxXKMmgnde1+sq3yf5xk4jjFtlh1Jv5g0Fm6lqRsl4tkUneVWBie5dUijfT0SnQ0ATAs9F0f5YOl9n/zZ6aNBCP6zrdpWbxeCuY/47QR9N4ftqi11ACBYm50iqaB15X63A4DvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291164; c=relaxed/simple;
	bh=qaGwawX2l41SR8cJLyr5DVUNHScSlypsAnhZbYeYcn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nbe7anjOT7F+FwVyceuZRE8ajqtksqmTkf7cYV5aSRT6KtIUHv671Vtj1cwA3gZLRKKtUYlfjMPI2mlcR7e1z3wWtm6JojCO7Rl8o1xsKQF26RUIRJ6Gg0OSHzCtglU5qhn5rwjgYudC7rmXaI2HZPzjtygl/RC0IlJaKsaKNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvqrWUo9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvqrWUo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6981F00ACF
	for <mfd@lists.linux.dev>; Tue,  1 Sep 2026 19:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788291163;
	bh=gTb0PbTeAH/TOzITahU9JQpOG+u+beSlQIvzKC8ghuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZvqrWUo95Bkgl6AMqVmtBx8U9PcT1MMgE5MuUtYupnktNnhXyfBzDydyM+kmOc/Bt
	 uxwmhQKT1J3Q+KKgSW0PIJp7CcubWhP+pocoAr8yq6Z6Jn6Alp+gf2UsCCJDu7SX80
	 Uc2dOQizCknnK2KJ42mg+5I9idxliJihtb6Nzk7p4QC2yavavggCP9Fkz9CvGcB2vY
	 vSb/FatTFlsSRzhfa8CpmKgA14Eqeargd5vToR+zMLWj8wswoq/EZz+8aVjfrEZhNH
	 gnwrAcdcj0Gdc1pq82COl7m5oPIJFMO0Xd5okA+f9+KGbnxgHGE/PeP03x1juYmGT0
	 J8gBXtCkjEGUQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so147267e87.0
        for <mfd@lists.linux.dev>; Tue, 01 Sep 2026 12:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/kKe68hDcdqQ3Pv/bWyOEuQf8zqwjQ16d6UQkKS3j/7fx7BtZylZrniUg24gtyB6YBQE=@lists.linux.dev
X-Gm-Message-State: AFuF++kRLQq4fabS/Q7L/QJpe2aJ85NQz2TQPnBIH1HrEP/ZuO6LOMLY
	xBTxWt+BIeeyk4P7BaWacMMwa77HLR5sw1nHTL6Nd5z+xp2h8yEwjsgvLh/I0J+FBycHx6nAUQn
	4Uxe5/rTCjrv/AyM/8z+o1i1nTyo7iJo=
X-Received: by 2002:a05:6512:b23:b0:5b5:e57b:9126 with SMTP id
 2adb3069b0e04-5b60832cddcmr35447e87.2.1788291161688; Tue, 01 Sep 2026
 12:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>
 <20260831-subtitle-anvil-0f33fee6c2af@spud> <CAD++jLnBSrzXnPdtr_NqTymqBupYv_-xW3NAMCa=7Dx1RwtAFg@mail.gmail.com>
 <20260901-zombie-hermit-798a9851e3d8@spud>
In-Reply-To: <20260901-zombie-hermit-798a9851e3d8@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 21:32:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLmnVu-awNWEjJYJv_L_sOmxefr+A871xoxvhviZR0DewQ@mail.gmail.com>
X-Gm-Features: AcwNN1Udlk2fn-aq9UBLZcc1lUGjsHQYeIsY5pEoVHaSin971VVGK61XvAEaHJY
Message-ID: <CAD++jLmnVu-awNWEjJYJv_L_sOmxefr+A871xoxvhviZR0DewQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] dt-bindings: mfd: ab8500: Add regulators
To: Conor Dooley <conor@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
> On Mon, Aug 31, 2026 at 10:18:09PM +0200, Linus Walleij wrote:
> > On Mon, Aug 31, 2026 at 6:18=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:

> > > > +            ab8500_buck_arm:
> > >
> > > realistically, all of these should have -s instead of _s.
> >
> > Can you elaborate, I have a hard time understanding that
> > terse comment :D
>
> Node-names and properties are expected to have -s instead of _s in them.
> so ab8500-buck-arm etc

Ahhhh "underscores rather than hyphens" :D

> Although, all your existing ones have _s, so there's conflicting
> feelings with my OCD. Do w/e you like, for that reason.

So when these bindings were first merged they used underscores
and it was an OK thing at the time.

I would use hyphens for any new hardware but feel it will be
confusing and lead to typos if I break the style on these old, but
hithereto undefined regulators.

Yours,
Linus Walleij
