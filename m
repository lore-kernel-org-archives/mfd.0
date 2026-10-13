Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24E3E49D6
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873831; cv=none; b=hnmFXKtf8rYqcr6XnAEzvw2USuYkd5qzcJJ5kEtQDmilTqcPB8jSoHruCDne3vfHUnWT0XUJEm2eW3QKQWCyd1I/YDXhWVffJ0VnaSrNS6y4V1unRLDHxSh8nVcXsUEEDsoll58xte+XAyM1OrZX4PwXeDKEgql7Z2wD6QlTcC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873831; c=relaxed/simple;
	bh=/RLyxk0Jq2u1PVEyagKg3PlWxxGnKN/SjtBn1Bcha7g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B52SPOQLkTSEJKFp3jpUsyCeyj4GoNJrpLBxYMnCxtUahePPPZ8i/v6y92Bk51cNPevgeUiU2R/VJ+QK20vBhdePhwXBvgmrkQQJH3CAHFQjeyvU/WlQXhsf/n2Ws4swk/QKV8Nz1YIeEAsp/aNXNipjcBOPds1scV2LJOzm27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luvPhL2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luvPhL2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7231F000FF;
	Tue, 13 Oct 2026 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791873830;
	bh=/RLyxk0Jq2u1PVEyagKg3PlWxxGnKN/SjtBn1Bcha7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=luvPhL2gaTU951+ImZQctaYt/hf3S3OZzLgCWjlVCEGP44CNDHqSOufdMF6nPXzhP
	 /0nfjvpM+ATPPGVTqRyPQihw4HJdoqTcCYQWv8hei2RY/sai1I5aNSlcW8XeU4aXWt
	 OAua1hrVV12V+nq7qsmfiQHRX5knfWpTgQIoayJlmUgbjcfCinQjyz2T0v8EjQtpNd
	 DrlNH4E3lWxrr41axXdWkrstR16eOOEtMSXIUs+8wH4quD4suMw1hzZYl353CITPNH
	 0WVpzqQ3uOrJU6mQcnS2T9S01/GWc056bDL3cWeA/YOELD5fDjQD269UJTQ7iW30HX
	 MwmJqe8/6UMcw==
Message-ID: <sashiko-outbox-169124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/12] mfd: nct6694: Check the length of received USB
 packets
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-3-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-3-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:43:49 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The response status and the interrupt status are parsed without
> checking how many bytes were actually received. A short or zero-length
> packet leaves stale data in the buffer, which is then taken as a valid
> status and may repeatedly dispatch the same interrupts.
>=20
> Reject short response packets and ignore short interrupt packets.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D2

