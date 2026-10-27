Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069430;
	b=uVqYssif1ICA9qjVcGODYuzpLfKRfZpaWhToIw9TEo8wRBzx9OWZWr57iOS0kd0s1EEK
	 XFohwXtyWKHcKaMD4McTsfJLtkdEmHptBXlNLdFwiQvPjxF++CHu9x0tveap4KfAD4qer
	 IwJXUJcfQdDrXTGyPXpS1TM76bolb+DbysnvAhzr7iSD6J8Bnuq+0tqn/Zt8/bMUEslEw
	 Eh13x24u96M7RExbtj0sdWuGdEBml3zu3PfKrEmF4n9fPaV+/7aDQbvsejeqwOaRuKn4V
	 BjS47pPOOiaS6HZ/FyuGcHlpGWLt5lcNO5SFMGjJKu4zWjGbqSBOm2LXN5wHPAuYPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1vuRaIAFHzPFSu8P9ckGYhLAJ9FVwAMCZ1QGqkEyNGQ=;
	b=bSOk72HiAmqqiYasAwhHCG4dcZU8quf8TwaPzP5bjyfqHryd5UblwMNAHn5+gifezbGK
	 xM7zKIjnW7dNj1oh78t0tdOatj1lwZs2ak7mvX3RHvIoEGLwxMOe2oUroPYi1v2UY64Dt
	 gNt0WE+j4qE+OaoOkT/OQ1ulxUT/Utf6anNJFEjeY6hdwnJuoA2GzOMAS5+9ebPzPyiFV
	 fae/5gnH4gxb5PZ2oxn1GqFGTPVCgch//R5+9X/6AEcMP7Faxba2w+hYjGheA/owlIVe2
	 0qwZeMKn5v2I084P2rYe9I2bUdolkfyQlelRhUL0hWkcqG60/SpQgf+P+M10mXODiGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VybAhsMS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B05606A31B
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VybAhsMS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C56A1F01828;
	Tue, 27 Oct 2026 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793069429;
	bh=1vuRaIAFHzPFSu8P9ckGYhLAJ9FVwAMCZ1QGqkEyNGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VybAhsMSXSRcqHX01fLbxNO8DwLwaCqAEX7vI1u5lBVJW9JjAFzPCeNA0qT3CpwqW
	 F076OcUS1gdzWwuFQefpMUI66iAiZjsZ8sm9T+BYuS8tc6KgAKzQ4+c66uqQELPc/Y
	 spdP19HG8CUpVQbksBE8YCHlS3DHP3ITrAYfT+OGnXR1bk+xRiEGDSa9saMyfLHoN9
	 7Ldz4ROfIPy5HSN9syD7onbjExRy6IisFSWSJcdwueyGcXFGXfmA6VeHScSPI97tOa
	 sMog+kBGXNfv2HVEAGm6DzB+Sc6ePuRN+DJtkuAEFMVZqkiSzz90Qwk20MtARQLbSd
	 9Lcc0qyiFu6GQ==
Message-ID: <sashiko-outbox-186032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261027024609.117371-1-lgs201920130244@gmail.com>
References: <20261027024609.117371-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 02:50:28 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: hi655x-pmic: uncapitalized commit subject description
--

commit 38d6e9efa2306ed22118dac052a2775038d5b1e8
Author: Guangshuo Li <lgs201920130244@gmail.com>

mfd: hi655x-pmic: fix IRQ action memory leak on removal

This commit reorders the teardown sequence in hi655x_pmic_remove() so that =
MFD
child devices are removed before the regmap IRQ chip and its IRQ domain are
deleted, preventing a leak of irqaction structures allocated by child drive=
rs.

>     mfd: hi655x-pmic: fix IRQ action memory leak on removal
>    =20
>     hi655x_pmic_remove() currently removes the regmap IRQ chip before
>     removing the MFD child devices. regmap_del_irq_chip() disposes the
>     child IRQ mappings and removes their IRQ descriptors.
>    =20
>     The hi65xx-powerkey child registers interrupt handlers using
>     devm_request_any_context_irq(). During child device removal, the
>     device-managed cleanup calls free_irq(), but the corresponding IRQ
>     descriptors are no longer available. As a result, the allocated
>     struct irqaction objects referenced by irq_desc->action are not
>     freed, causing a memory leak.
>    =20
>     Remove the MFD child devices first, allowing their device-managed
>     IRQ handlers to be released while the IRQ mappings are still valid.
>     Then remove the regmap IRQ chip and its IRQ domain.
>    =20
>     This issue was found by our static analysis tool under development.
>    =20
>     Fixes: eb10245fb37e ("mfd: hi655x-pmic: Add powerkey device to hi655x=
 PMIC driver")
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

[Severity: Low]
This isn't a bug, but for changes to hi655x_pmic_remove() in
drivers/mfd/hi655x-pmic.c, MFD subsystem conventions require capitalizing t=
he
commit subject description after the subsystem and driver prefix. Could the
subject line be updated to:

  mfd: hi655x-pmic: Fix IRQ action memory leak on removal

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027024609.1173=
71-1-lgs201920130244@gmail.com?part=3D1
