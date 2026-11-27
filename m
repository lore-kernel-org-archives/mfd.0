Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798580;
	b=WFW5Tjxeuv7rs3okj0vLeiVgnQE4qsiiCMT331RP6A1JHbKTCbRnO3M57Dm4MvVZcsR2
	 FITEwMXKuIwCImjDxTRZOoPMnTXOOK2ZWcY5pYbhmtD9JoeOh4eBN1mdZASuNzkpZ6p+S
	 1r7yIoxUzCmFjflhG/D3kXNwaMrcV8eopl523/frvUU3beCxLCxMjw4I81mAJGAquyCq5
	 PlMinuYGccLmjGAW6onyIH1+RTPVJhWhevwLhNiv9kvTNQzaRTgHF7/biOneS9qMcr6Aq
	 bTQJdTfIehBe1cyt+oHocKmvi/1VnpFL2/nXnEMMPvHfvSbbWSP2BieaMFQLKy36JrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798580;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bkvd9a9OYWpaXi//Gy2hWuV1Bq/JvifHEQiZbb11oOY=;
	b=qqnbYup0lgePMO6Jskcq9JHlTXccIu9I47l2tb2Xj+VtK00a/0ettl+i54A8tqYItOdC
	 ePiETDgwrHh9DMoft29m+t39qw6oIQJQByjwGLs1cv/vtIejKZ/iYwd7TezqWVnjSIy3L
	 YUzKWATPBx8fJ8OlXF8ehjkQzfyjaapjmOkiJWyR6obW5S/YRR6MfTanSlaf6ICQCSIxS
	 jIRxMkdNFqZ15yrM0ZD44AxItwFe+2tYQFPxNyCtTYJgeWaGpSxV21FJ2aan1buT971Et
	 ZoqvCiWwXKBUVEB8TDA9jzuLEt29Q2bL1NwXd8tCSTqj8WKxbjTNvfIGifo/c02BYJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ToWHDrqb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBBB606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ToWHDrqb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37C61F0089B;
	Fri, 27 Nov 2026 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798579;
	bh=bkvd9a9OYWpaXi//Gy2hWuV1Bq/JvifHEQiZbb11oOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ToWHDrqbV2c8IVpIon7vFPWPoaGJ6XH3uxAI9oM4By1cbmG63P6+B0PlkwwgiYaIZ
	 wxh3cRWnECqZlPXTGb3uzEEW6cdwEjlaNtnQBPZbVX+Uv+xNtcK5EQXa31FxMpDhYn
	 0Z/VM5GwBgJiXBheMyJO9w7f0CHxHpodLh+2WJppGkU2zkepGqOKOwGXa7VIyMoSEy
	 wcWz7cUVX4OSTuxXPbc2KOaP2nJcA/nIJvBZzFXKAFI+0AjnZ1YFL/QrGglTGU+Cr5
	 EnibWRguk53lAzrHrukA4y/1UmwSgj7/ARhxtEp3APCjcP13XJdpAGisy1p9Y2+ZZ5
	 oyTyUGilV2rMA==
Message-ID: <sashiko-outbox-237951@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 0/6] mfd: max8907: for Lee
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:56:19 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 2, 3, and 6: no issues found.
- Patch 1 ("mfd: max8907: Remove platform_data based probing"): 1
  related pre-existing bug noted
- Patch 4 ("mfd: max8907: Add restart handler"): 1 related pre-existing
  bug noted
- Patch 5 ("mfd: max8907: Add ADC client support"): 1 potential issue (1
  Medium)

Detailed reviews have been sent as separate replies to patches 1, 4, and
5.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127164044.2859=
10-1-clamor95@gmail.com
