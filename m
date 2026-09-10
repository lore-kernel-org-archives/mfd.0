Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AA519CD0A;
	Thu, 10 Sep 2026 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082115; cv=none; b=oLeO2SRiyQQvD5QV300Ogu5pU+dmy9IFd1gGEMxo3G/1Qh1bCCbVBC2gQDqzIELU/pouSPYYa4xp65QOY80+hwKxURrSAulFMYRTetTJDSPVAShVjNMuHdzOuk4MMIL4pKjtEShWk5nvgUBEQFOs0Lyxo7XsaPT0F1z3HLBxqG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082115; c=relaxed/simple;
	bh=78G2nB58S/Om9Hnkh1If2+9cAxTheQoBa4oMxHb07MU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCRxt0rXk8pT4S1b/HSov2dqekYXO8Ot+uv4IQpRJ5jGypEx6wSiuXavRBL+cqCbyaKZ+im3uhkSLmFpuOgdS0XCf+SayDNHWs4Eg2tHlDGnJKmKPWNEw6Dc0WOcFaQ1CmQdpN9G+Cfc1WrMm8TFiys+RWn1pn+fx98sllcWhTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9yRc8G4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9yRc8G4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99DD1F00893;
	Thu, 10 Sep 2026 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789082114;
	bh=78G2nB58S/Om9Hnkh1If2+9cAxTheQoBa4oMxHb07MU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d9yRc8G4Gfm7PLoOSOlbXnTKmXwADobG/b06+KzzV+0jo8RB2rUZtHAWU3/rWe72J
	 ctFT3aQvoazjhJGyd+qvv1IgaEsuamnK78K+ZKhSPFUGTn2gB0kZxuYzc8Jw41Xp8i
	 gw2hQipm5vnndcxlMR8BZP6hWHrN3YhJE3lF3BI0vQFSOFU8XaQ5SHu0xBAjLs7W+2
	 3afBFLtMe+RnuSc+Eefq5N9gsUB7mruiWfqoLkEu/SezpvZnc80IMJaHtgC9ALTIpa
	 mwbOOzeee18wfCF5zgTDFRGo62C/xvD73Wqig/osZqsRGTMH7XSJ6Io6u2auH9xmAO
	 pC2th9oY+8eGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] ARM: dts: ux500: Add Samsung phone sound cards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-7-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-7-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:15:13 +0000
Message-Id: <20260910231513.A99DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The released Samsung product kernels all connect codec DAI 0 to MSP1
> for playback and codec DAI 1 to MSP3 for capture. The codec provides
> the bit and frame clocks, while ULPCLK is the machine driver's default
> audio clock parent.
>=20
> Add a common Samsung simple audio card and include it from Codina,
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D7

