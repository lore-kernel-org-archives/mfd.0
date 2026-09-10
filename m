Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688249E12C;
	Thu, 10 Sep 2026 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082057; cv=none; b=kogRXNjpGJ0Bway42e8U791a+/pMdz1DnmD3zfHq7k5pwmr4xIR7YhB/Bj4LWc3mfwgqr4reiLEts8bV4ojPre2MNgJ4eoUjoQEzR8fZTzLdAzIU3/1mmOVi2LCL0E9Wkse1RPrvL3Qy33zbUxFtglWNtk7LgUtcvvL3uUqantA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082057; c=relaxed/simple;
	bh=YZH2jTMHRsuAvXt0jdkcjjWSOsxCtl9EbxFb8F+qBUE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h4wd09aTr/xHX2mM2PCMJeXayWeae6dTZayCFra0SHVLew6rsVu7anRu3NEWYvrdOz5wCxL+9KMGZhxuxj1/HiChDOLM8wlKNXmVl1/xPR5tcUZwKyIHNJgHWwwV0bZeXqhkdfDtGCgvf40h8yc13svVVavNhXpivW8p8eUHq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE1SmBx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE1SmBx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F781F000FF;
	Thu, 10 Sep 2026 23:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789082056;
	bh=YZH2jTMHRsuAvXt0jdkcjjWSOsxCtl9EbxFb8F+qBUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZE1SmBx6XGEDr4JXGr5A7uEMtIqrLOgSF3EUGCNryKP2moZ1eRqA22//KdZ3bjZ0I
	 16SLMjM+8T40+gYiv3cwQBqoAZYIo8uILpoRY5aw/paYITnygQhx6tPe/dDBDhnwJL
	 4dk5zosRFLBMs89KZBfawtofMCqUoNX8wtdQFH7c+Cv0o7Y3S4GTk/gBmFy2652PLU
	 kh++C+SolRb3duZ66cN/CQVRsxVtzqZqPjiXQmEjrqhwmFoHgRAECV1FKJYUn5LqIG
	 AR3/VkWlwSNFoMaoQ2a3YupvOO30B1a7DG77bMFC80Wjlj+krmfF5/+2l1jhQGIfiT
	 yLnpp/+BGF3eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] ASoC: ux500: Remove the MOP500 machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-8-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-8-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:14:15 +0000
Message-Id: <20260910231416.38F781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The Ux500 boards now use simple-audio-card, so remove the machine
> driver and its obsolete binding. The generic card obtains the DAI
> format, clock roles, TDM layout and board routing from the device tree.
>=20
> Make the codec, MSP and DMA platform components part of the Ux500 ASoC
> selection. These providers were previously selected indirectly by the
> machine driver.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D8

