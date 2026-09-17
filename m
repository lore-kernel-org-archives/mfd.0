Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A74C652B
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641645; cv=none; b=TVs7A9RQLxqrC7HTY4494RJcx5ADhkikUK+/WSSVr3mgRMNBqbb2whawRVrTFWZjNuAwXpGd0YASv/yoFJo48cSTW5xTSjXQ6xYanh+4iikXydnsijaI4D2Rnf1nxOC7Rem5qvOuyGHi8IyQ+xE5uA+odB2TeufPECK2whpWA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641645; c=relaxed/simple;
	bh=RQ3UwcggviXxPQoH7mA9UJPGXVp4Aslo5U0vbk8eolw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SKpjpMFV6/Ybri+AcyeScQgORCoTWU7csEjegW3jk2pGHAqyz/ipwiwGuWc0wrWO2/DYHJ5/Lt188GLkjhffYFqDo3PlFhxyJZQ6VZsupdeAnPZ0nMfTBCUhhAqAs1rqT5ksUIzC9ZL1rw8c55ptKeJpLXbZkCbS8xcwbMavQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dh06+xD8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dh06+xD8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642FF1F000FF;
	Thu, 17 Sep 2026 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641629;
	bh=RQ3UwcggviXxPQoH7mA9UJPGXVp4Aslo5U0vbk8eolw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dh06+xD88mp3CQLWxztfwVFarUtFHUVn5FGlEwBjfT61bJtX2awIrM0YmnpRnH8kd
	 DP4pVl5By2NAam6zS96FBo2gYDaLkqS86/uhf3WoukGN27hF1HxIyFhkxnmhCLomd7
	 ELlcVsDdxpQCJEf/gq76V3A5fyY2tvTJlmXn1v4yduP5srjrdZ0+JDBagSS7eu3s+Z
	 +HFx2bXh2M7OYi3Bq2cuxPRpgh4oRlIGIMBkCQiAmOUkRaLZn1PTpVaLIs2yKAN8df
	 WIJO7/6DBiUz8TcziX2js4H6yDLnbsgPqPHIyA/TB3lsqevYJJLyqZK94QWi8Qbczb
	 q05Memist404Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] mfd: tps65217: Use devres for IRQ domain and
 wake teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260917103312.92624-4-r.zhambakiev@prosoftsystems.ru>
References: <20260917103312.92624-1-r.zhambakiev@prosoftsystems.ru>
 <20260917103312.92624-4-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:40:28 +0000
Message-Id: <20260917104029.642FF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
>=20
> Removing the parent device used to tear the IRQ domain down in
> tps65217_remove() before the MFD children are unbound: the i2c core
> only releases the parent's devres after the remove callback returns,
> whereas devm_mfd_add_devices() registered its own devres action which
> unbinds the children. Children that requested interrupts from the
> domain (e.g. tps65217-charger) therefore call free_irq() on virtual
> IRQs whose descriptors have already been disposed. With
> CONFIG_SPARSE_IRQ free_irq() then returns early without stopping the
> threaded handler, leaking the irqaction, the IRQ kthread and a module
> reference.
>=20
> Register the domain teardown as a devres action right after the domain
> is created instead. Devres actions are released in reverse order of
> registration, so the MFD children release their IRQs first, then the
> parent interrupt is freed and its thread stopped, and only then is the
> domain torn down. The same ordering covers probe failure, which no
> longer needs manual cleanup, and the remove callback can be dropped
> entirely.
>=20
> Balance the enable_irq_wake() in tps65217_irq_init() by registering
> disable_irq_wake() as a devres action as well. Only do so when
> enabling actually succeeded, since the parent chip may not support
> setting wake-up.
>=20
> Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917103312.9262=
4-1-r.zhambakiev@prosoftsystems.ru?part=3D3

