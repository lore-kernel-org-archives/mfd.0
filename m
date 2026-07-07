Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942A0378D72
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400914; cv=none; b=FZoM5gQDDISG5hzctoQmhAg4AowMgv9S0pfCrW3kmJ3ucZjbmiO75Qf6+31z5/85ZgHroE3GYcLAX1T4ppEtkdtA14VZRcuEXcOXh7YiUJm/CoNGvtCP5svA7uITv8rnf2RtCdBjeBsBRAIhg9VzptXUCzI0grD7/2zdVeWVIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400914; c=relaxed/simple;
	bh=tD3ONW/XAFBVsxp//UY6eq/1NP88fq5qGzATxEpOLCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kraaxZZ/g2A8ep5WZ77ziJNyayH0VyEsTMIxgeM/nYaEJjQxNGYifEyxD+NO1zwyj8aoPYD9Ha4NHVLrVB5B0/tRqE3nFwTEj06Pk6Jb2GptkVczJxM2CB2+YDCTY54S7pmj16p0AFfd5O4Jafdx2xd6Yw9y1IYmOuWvN1JmpJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLJZjcFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLJZjcFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062331F00A3A;
	Tue,  7 Jul 2026 05:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783400913;
	bh=tD3ONW/XAFBVsxp//UY6eq/1NP88fq5qGzATxEpOLCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLJZjcFETyO+3Rc2RGihEPzZjRrgt3li9aDl9tXKCvhy0hJKg8apwpG3eWqQhU65V
	 WtVN/FesitR52dbnVPrG6KI0Vg7kIsOMA4D5yAEzQnDuncmBJhzhqqeoz117S46nJx
	 OiLTCjwJBXTCUtlg547oT+3UuJk0g6JgAazvXPVdf5lv/7vgPcfkm642TK8eCteJUn
	 YH/Goz/R38HBI2jqyFOjc1Xpjc+8GseJ+jljInXytT7NeukMTJpjuzFZGAEc1WpQ4Y
	 i3suKQSRCMR61SUirRn9YE5Jue/8zb50mCce8jnnZKvspdYrjJnYP+XplatGFRCjt1
	 86nexCN1SocrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: ucb1x00: Convert Assabet gpio-keys to use
 software nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 05:08:32 +0000
Message-Id: <20260707050833.062331F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert the legacy gpio-keys platform device on the StrongARM SA-1100
> Assabet evaluation board to use software nodes and device properties.
> This allows describing the buttons and their GPIO bindings via software
> nodes so that platform data support can eventually be removed from the
> gpio-keys driver.
>=20
> Define static software nodes for the gpio-keys device and the six button
> child nodes at file scope using relative pin indexing on the UCB1x00 GPIO
> controller node. In ucb1x00_assabet_add(), register the software node
> group and use platform_device_register_full() to register the device.
>=20
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ucb1x00-as=
sabet-swnode-v2-0-e6271ea3d3dc@gmail.com?part=3D2

