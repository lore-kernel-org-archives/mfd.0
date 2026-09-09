Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFA657F742
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970408; cv=none; b=qGYM/fubzqwfi230e7y8ZEKL42x/e7oG88C0oBuLG7li0wWOmKW7MtB6/iNh958pAumhxkAfTPOEF6OHJ+8F3asgPzJY03OmqKvMgOqKsS7uQ7X52tUcTTDacqDHChe91OWVz8n85Bfmp3LXJrC3o+eXH1PprUiRe7COfjbcOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970408; c=relaxed/simple;
	bh=xhpZx3w5CDcrcLvLAoXCPl9/Vx4RqeDW85q0o45AOFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWwt74EukEa5slE082Cm+Ut6+MFqmxbfrzRx4X+n9XujlBSCQIGKzskM768JRbVfqEMrqLmar5Tocx8B+WoUS0FLH4nXxBy4GUb6ee8OpgGDj65uUekuWogljTOzP1LNzIETHqs2uwbcdlXMiNsYEWwrHTlQDDgEt0BpZ+GYOsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VI8sD1B3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VI8sD1B3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E301F00ACA
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970407;
	bh=xhpZx3w5CDcrcLvLAoXCPl9/Vx4RqeDW85q0o45AOFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VI8sD1B3DtsDdJV9GLOoTMTAvPvV2/0gNIw570AhiUBRF2UskPD9e5CWBfuwSu2jr
	 no4ziOlMsH70ERA0iEZVGz/z3Rm9U+WdfsajZc2EZEzSjN35JDLyw0ScyPHEKWNM8X
	 H98YsFNfdX0uL/UQ8lp+PilR4qbdCPa+s2BDs8nUwNyBBULntVeHWldfK/gYFetYj6
	 9Bcio6bUum3S9E4SVuacX31RQw3krmgnCTPy80agpPkwq8HY9FzCkL9IAoqNDaXw0h
	 yzl9kd3wzNncoQgm8aCJ3az8hJNHHU3HwRkZAthL6bJ8HfivyvJ6vpoaTv7DLZzbil
	 E8O69uS9OUhyA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so4923440eaf.0
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 09:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+y6hhdIZt9fnjlzO4faDu35yTVD1TCUpTUeG3sMtmuBc0seaoey7IerLa2GPe9EcE/sY=@lists.linux.dev
X-Gm-Message-State: AFuF++nsrbO5BJyoSI++SuX4rawMQB1zDJP2c76/E6ME8aGvScwERwef
	gWPS9UT8r27CYQvIIhFHEWhOKH8dq9kgAgwjVVj3wRXA5xbxUQ3iO4A2VJa4AqlfsLtLtBmHB0U
	aWRA2HP3Kw5TPfFKwu9pGvHkAxCACLoY=
X-Received: by 2002:a05:6820:571c:20b0:6be:e96d:73fb with SMTP id
 006d021491bc7-6bee96d8664mr1024973eaf.66.1788970406325; Wed, 09 Sep 2026
 09:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
 <CAD++jLmFm=BwwYAW4Wmumb53CJeFYzwEAMmcz3OKa2umcR4rQQ@mail.gmail.com> <20260909151336.GB2133376@google.com>
In-Reply-To: <20260909151336.GB2133376@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 9 Sep 2026 18:13:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4Fxwybax+j=_09xxtSYWSbfKhhvLOQw580-DnkFrmTA@mail.gmail.com>
X-Gm-Features: AcwNN1UIwLS0gV-UM5qmgFyN0TdtnO_4diy8sBsFcraba8bblMSWi1RWVXm1ZSI
Message-ID: <CAD++jLn4Fxwybax+j=_09xxtSYWSbfKhhvLOQw580-DnkFrmTA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] dt-bindings: mfd: ab8500: Add regulators
To: Lee Jones <lee@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 5:13=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Wed, 09 Sep 2026, Linus Walleij wrote:
>
> > Lee do you think you could ACK this patch so Mark can apply these
> > changes?
> >
> > Technically maybe it's mostly regulator stuff and DT binding stuff,
> > but it'd be nice to have the MFD maintainers blessing.
>
> Or I could just apply it, like normal?

Either works :) go ahead!

Yours,
Linus Walleij
