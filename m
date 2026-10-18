Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D073A5443
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339887; cv=none; b=jetWVBwfKewn/cy1eVHt50XXzAoB3htUEGmRdH4PNxneGcCzOvDHB4/ZBaS9o3WPAxaToZsnm6oSkJk0PpjwPm+q0gxDIcp5vf+BKNUFTZjhNf2m5Q6xnmTvtUunIhS/sd3rd1gNNIg8b3duYcjeJbSsALYRu7T9cQdR7oqbDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339887; c=relaxed/simple;
	bh=O76RmvjEl58CoGsKsi2sFphsw0X8MuXgOu9e7Cis7ZI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Bnaee78UanrYzs4LPL/1gltKvIlKo45Nj2hS3GSRmWeCOWu5sPX+feSu9fi+iWyDAOd7nxJ6rkJe5cL3t9ZDzOWAVxPm1vDRing5+OyDWrVJgIYJ8oK4yjTHslMmgSefMlYdpQDshx4TNf0urxsx8QfdUqyW+bnMRVipAcsw4F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlmjXVgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlmjXVgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190121F000C4;
	Sun, 18 Oct 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792339886;
	bh=O76RmvjEl58CoGsKsi2sFphsw0X8MuXgOu9e7Cis7ZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JlmjXVgyknxnaoA+AjYstocXAv23lpgfC1rsSEC09IEHIfey2yXW45eHYbl3lT0l8
	 Xx/UrQFcQRdo1LPvLzkvoLPrURuKCESW7ZooSxFO0PPa4TUY5f0hGSWP8EsZeiBuJ5
	 OtdDfuK0Udd/SvYZDR0yticmhXGRFJCotdRENpD/xW/p3C0TrCCG7sN6YZ2w7ogHm7
	 8kRTeWVNlfDRNnIEPYlR2AXeTOlfVdpq/ObfB2rr2Iues/nZ0g6P4Mc7zsMtDDSpSW
	 WAqmZVMN9BHaEjixO4XL/P8calk/sbAiOLCEUkM10XbxvmRtD8se85iQ2HsVoR/H7L
	 5bOwvXkfdXoZg==
Message-ID: <sashiko-outbox-176264@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] irqchip/realtek-rtd1619b: Add driver for Realtek
 DHC RTD1619B SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261018160653.3940371-8-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-8-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:11:25 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: James Tai <james.tai@realtek.com>
>=20
> Add support for interrupt controller driver found on Realtek DHC RTD1619B
> SoCs.
>=20
> Signed-off-by: James Tai <james.tai@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D7

