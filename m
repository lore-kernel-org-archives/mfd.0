Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102184A7CA7;
	Thu, 17 Sep 2026 22:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685776; cv=none; b=c61QMUQQsTGCnG0tDKaV/szJz1MzoY08AcCzAKIFjjzFuPhLrU/ynfvL5zvF4kWOJXQIeq9LgNqwXkTji0ZrystwTjzU8iQy7O3lp5nKfspLkrrbQ7/0SOA+b5gKSu09n//4lEU09a3QLexITCwXgudxVBkFR9nyoQQN2pI9zm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685776; c=relaxed/simple;
	bh=mwwB0au0OGevsjdtk5A+67v0MEqF3gCI4+9vRV2WHB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PZoF2vqX0+8rYh2RpSOFBgp9vD4k+KiBdiOhyHdevOKuPvFLJL2sjGuxULvLCCWUo76p1zHEKDOtm6zmxusL+ijPvv1Rp/msJS2JMfTuLxp5fTa9N5pOY9ZjlMhxPrXEzSvCjZSIDtc2ZFqCGXSJ0fQNJ3lxorc8UcCY4RGAsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1U3dGMr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1U3dGMr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4439D1F000FF;
	Thu, 17 Sep 2026 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685774;
	bh=mwwB0au0OGevsjdtk5A+67v0MEqF3gCI4+9vRV2WHB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1U3dGMroI6+iweRtBTCwCg4rYTSW1VP/EBJN2yAYVi6SECsMDVuGERymdkMZjRHA
	 7K/MWa/s7qRPPqz55RMXtEYgPQYtZMgdwC4vMigAVzgDHwGh3k3oHSip+Rwu4i14lA
	 yiEiMvwlDyxJQBp3s606u0LZIEGKuXMVeWDFoGoaVwTInomWfY89ufneLmGmjFepLI
	 88ZajsyV1Nrm2wha7rrApll4AAPf+ZhLC+u1mVF7p2dWw4nF3TOeXNqMyXnF1Qda+R
	 OKDSvucM8vtX5L/YNs51Jk6zWLECW1YM2/C8Pcn7oMbSsz1Y9Bw6VTD/jMd8RwEGkF
	 gz7pzLPqVtqZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] ASoC: dt-bindings: ux500: Remove MOP500 sound
 card binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-3-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-3-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:56:13 +0000
Message-Id: <20260917225614.4439D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The Ux500 device trees now use audio-graph-card2 and no longer contain
> the MOP500-specific compatible or properties. Remove the obsolete text
> binding rather than retaining an unused legacy ABI.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D3

