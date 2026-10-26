Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028964;
	b=m+I4C7m3V/nuIsrQc87KkUit+fjdUWLovqar26S5qC21/TgvHSeTAQC8Hs3EVgQBF7J1
	 bZ4ClR82d5QgZQNOB0sizeWag8EGUoL2LUUh+WaxfMPg7VIUEQ4wET3uoufuIoDd9yu3J
	 koWsQMN4BPYRJlDrAttFQkTXNj1f4CgmFaHsJ+3o1q2YGu3uuhZvUwX2mf+3H2Y4bl/Y2
	 E5P+5mIeeVLTMRiWOY7mCulzn+gm5kyQqGgP342lO1Se2SZTRVmKrlqx6Ga6ofAFs8MRY
	 XT4IzDehanequDLuA45RnQAJgVI2blyprGex0fheVoL4Yszmev5y90t1dry+sU0EMCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MmmFGEpDXLTLBAMlQQlK+Vo3QA/j6Irlrkxitqjkr3s=;
	b=DTaXgyXtS9AUUWs/nUaEK9Lt5RRDR33ks16DEisnKouwQLiGrUdkyiYsfIjK505Q5hTy
	 +7JP1h5XNLvh3mo3mjzDgjaH5iAnnHWFYT4o/1Cr3NxVZROzj04wrZvlnjli6PlYEKZtN
	 SIjC9ibOqsglOtskF22qhKEwlAKE/m2lNXj2WoZU40jPWhlUmHbmrKu8nSGXHA/ZykDeo
	 F54ZI85afEqRqAXDd68B+RKx1pn4d0Lu3Rx8oxA1ayap2yV4TH2S+P8a4dagMwR4KJEfL
	 rqKwJGCFqsQLXz+yg/NT4/GxutP/5jB/Js9koHGgmhmRN5GhpIgBpddMLeWMZF1Qwjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJr1wM1x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2043606A31A
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJr1wM1x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95C61F01825;
	Mon, 26 Oct 2026 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793028963;
	bh=MmmFGEpDXLTLBAMlQQlK+Vo3QA/j6Irlrkxitqjkr3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJr1wM1xAboi8TLcvdUKP8B+HOq9ieUtBJ0fgFqZeVUrOwG+IVuqvexI2D1+mtstN
	 V3UeeZAeoHCDYd1N0WaoBXVK1k9pr83O3g7fjT2VzlEwFULuNjpeqy/t6l0Wjs6fJ5
	 TerdGmjn8294F7DTPatv9UjvBxPw80TKcPA4E8ei6rnVKebCKQVotUZDhu5kDCLrgW
	 kpTqGXmb7skWz0d0rcuv+iGzyVt8Mq2yBBLu/uptwLPSZIdG4FJaGI9kYQekwoFot1
	 wxMRy7ObeAjsj9pFqK4r9WkKWcufD1P8ldRczgUUFFuTw6Orj5iE9CViQuDID+Y5hJ
	 0nir42fxwBznQ==
Message-ID: <sashiko-outbox-185449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] mfd: sprd-sc27xx: Pass byte length to spi_read()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weibin Liu" <liuwb@xiaopeng.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261026153253.689525-2-liuwb@xiaopeng.com>
References: <20261026153253.689525-1-liuwb@xiaopeng.com>
 <20261026153253.689525-2-liuwb@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 15:36:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> sprd_pmic_spi_read() passes 1 as the transfer length to spi_read(),
> but the length parameter is a byte count, and the ADI controller
> consumes a u32 register address from the buffer. The ADI driver
> ignores the transfer length and always operates on the first u32,
> so this happens to work with the 8-byte stack buffer, but the
> advertised length does not describe what the controller actually
> accesses.
>=20
> Pass sizeof(u32) so the length matches the bytes touched by the
> controller. The companion patch to the ADI driver rejects lengths
> that do not exactly match the ADI register access size.
>=20
> Tested in QEMU (aarch64 virt) together with the companion patch:
> the SC27xx driver's register transfers still pass the new length
> checks once it advertises the byte length.
>=20
> Fixes: 25ca4ae43466 ("mfd: Add Spreadtrum SC27xx series PMICs driver")
> Cc: stable@vger.kernel.org # 4.15+
> Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026153253.6895=
25-1-liuwb@xiaopeng.com?part=3D1

