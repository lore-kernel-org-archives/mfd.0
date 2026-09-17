Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75F3749E8;
	Thu, 17 Sep 2026 23:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686394; cv=none; b=dCRnn65XDY5O8T+inJlPNqRVFvb+8f18hdjq/uzO2HQyQjeB997rs1KDw8KSJ2WpUeJ1QeAmkvg7gsFWopS1Qv+4PoSTPveY6Dwl3/M4XRMQbw+AySW9SyBcy39cf2t+kqwDiRcQvvpKzQVsSHfnVic9mCdUbtVF0RkPr+LVCww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686394; c=relaxed/simple;
	bh=Dh7RLnkLTl81gse+6Pp9Pkzk5xZpZUoDU1n0h24OMaE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RNCvPmBlN+iF6cuZVPu5/3oSkihyEHhwwqv/LzzF2s4Na4jXCP/n5ZaHQJmslmFUuRVUyGYHW+qyHsfuVQhotmLgZPDy4Cazog/8qxJXzErlNzoc4vXFxYjoAqOaVssh0yqVer0f7kilo9DVEzxGdm37hE7jlVX+fwFWcbaWV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZctrOc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZctrOc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA241F000FF;
	Thu, 17 Sep 2026 23:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686386;
	bh=Dh7RLnkLTl81gse+6Pp9Pkzk5xZpZUoDU1n0h24OMaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZctrOc9esmypkA1vqHsX3kUpcVfuDRSs+oNqvc66Xwy4azN7fAY/zniicy52Nfkg
	 JggVQgHRy9eQmLqaNV3sD5HPuIbkPghz05bCOFjLzdmSHfHyh+03Irstqs9fSqT5aQ
	 3Lj5IDKMJNd5RZ194WNnAXeD+9u0G80aho4WcCXiawNTpXsMlJ57Ii1U2uExtTTmnk
	 iUrG+JjE9camcc8NQC3B4a4tdC+SNlGMM342rtOuQAo/zd3BBBAKQs2b3NzvtONJmi
	 HmGvldwXKrLUVNCq6MF8BvY/+812ySBFSj3mGBk1p6V2CVmKv98wVT+m/oEUP/8bqN
	 XzZkjNEkUOkgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] ARM: dts: ux500: Add Samsung phone audio graphs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-8-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-8-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:06:25 +0000
Message-Id: <20260917230625.BFA241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The released Samsung product kernels all connect codec DAI 0 to MSP1
> for playback and codec DAI 1 to MSP3 for capture. The codec provides
> the bit and frame clocks, while ULPCLK is the machine driver's default
> audio clock parent. Keep the codec-provided clocks continuous as in the
> product kernels.
>=20
> Add a common two-link audio graph card and include it from Codina,
> Codina-TMO, Gavini, Skomer, Kyle, Golden and Janice. Use the generic
> card name "Samsung". The later product kernels use DSP_A with an
> 8-by-16-bit TDM frame, playback slots 0 and 1 and capture slot 0.
>=20
> Codina and HD Codina retain their older DSP_B configuration with a
> 16-by-16-bit frame and playback slots 1 and 3. Preserve Gavini's
> AMIC1A-to-VAMIC2 bias routing. Golden and Janice use the configuration
> from the newest Codina-TMO product source; their board files are
> byte-for-byte identical across the available later product releases.
>=20
> Kyle's audio I2C bus contains only a disabled placeholder, so AB8505
> remains its sole active codec.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D8

