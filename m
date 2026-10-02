Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5F414411
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941393; cv=none; b=QLuSJB9BMGLntFCig3wv7G5vdzBvZX7lXySJSy3dMPUV+Q5b5KYoE9J9a0KsNOKNrCSk+rgXdRm2fSr4aNQmqiovs+8msC4x1p1BmQYbWrCCy+nVYWuuXX93p5Ny1rzG0RrHQ+vz32bt6be5yclW/aN4DS2ruxHcec8WJlEOPfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941393; c=relaxed/simple;
	bh=Xr27EzXqLVaWSff2Sv/t4+UbA8iGvDjyd6eWkg+nKNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gKZF0F9TJtCX1xfH28j9mqoblJcyyaCPPF73kRTrrqy7FeCZqVAJ6nmTd7fchHm3/ct0yO+QXDqtqcPyg9yQhxH5BPAVYvcTlKOCFQ6aau/GlZKgRGO7A1hjmePkSLO2jfpYlVZp0l39l77GHOyrBLh8x+y8mhaLCMzF7GFdS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyQ/3sZO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyQ/3sZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D349E1F000FF;
	Fri,  2 Oct 2026 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790941392;
	bh=Xr27EzXqLVaWSff2Sv/t4+UbA8iGvDjyd6eWkg+nKNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EyQ/3sZOzDxaLl2j/OTlPLhqd86/W1NhxydePwTVWm4/83L8HblPJiNG2ZHu7UTs9
	 L3KCARscYC6+p1dGZwFirlQPsbFNNcNz4HZAF3FCBwe33XoqppumKctI9ic5yGEkm5
	 HkthNAbo2OG6K2ONvvTlvcI8qgH66KyIfIrSsILBtFDqEfB8P5EZC/CDwx+4+3NKSS
	 5OS/uNcBSQ1auZBXPUwyvI5WiCCx8L6ZXdqn78rp5qc/PgvfgbZX1vxj/UcY845yDc
	 +3wPPEDxfeNNkwT/T11e7ZFKlzr98KubsL/t3AIDeD0o9nykp3BzESc3j5+NnF5pvy
	 a3fIqcn6oGidQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] mfd: tps65217: Use devres for IRQ domain and
 wake teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002113624.178588-4-r.zhambakiev@prosoftsystems.ru>
References: <20261002113624.178588-1-r.zhambakiev@prosoftsystems.ru>
 <20261002113624.178588-4-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:43:11 +0000
Message-Id: <20261002114311.D349E1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002113624.1785=
88-1-r.zhambakiev@prosoftsystems.ru?part=3D3

