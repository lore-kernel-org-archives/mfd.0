Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C748F039
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941463; cv=none; b=qW5J3+sYnHmR7pJjH85PxK552Uo5aY8i0waSvBnd+ntskC09n9eMZ3SXwXrOWkMWc2/4wEklUgeQ/BtNcyOMcobx5pu34Nw29jLewgnc39rqfSajzweNgoJDiSqwo8vocIfJ3oBln21XIjqgoBfaLcjeda8xOuWIXf3/1yNECAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941463; c=relaxed/simple;
	bh=aG+wtZqCDW13iFHSilhaDqEpzi2Ce9B3zDu2o0Eha3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=po0nx6p7RFeJFV2zXWpOy5TcxIVI7akb+o5eljvMnOUgUWGc49IECKWr1oG7nBPVqtBoJBUrDALv2BIANr2004NUnjLCySt+m4mTE6yVvB5kzwKbRWahQqNz5bXHY53OP3imFPtda4apDDXgTuKG82uJYSJevVIvltPFKGYNDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhVSsTMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhVSsTMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A203E1F000FF;
	Fri,  2 Oct 2026 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790941459;
	bh=aG+wtZqCDW13iFHSilhaDqEpzi2Ce9B3zDu2o0Eha3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WhVSsTMY4WR/h1UiI8J6KO5r1OXqBMJ6wS69wPs0pkSvL4PiBnlLHLUVSRmpjXPnc
	 F6ta5p86LwzvcVAnK0f51cTxujgqPdae+a4apkjB0cfTZN0hAW2KDWixHEKYXtLaIX
	 yM5rdpS6iUCuJUM4D+fIPFGG8NT42JjAfbC0Om2Xan57pNez+vLUQe2QLZVo75peHO
	 PHV1gE5atMT3YVg0Vmlxpfp4Fh/HgZdFLtPu4Yaj1zYZazF1bymZtnjSDL0dK6/Yy3
	 qN7tbEffgtS6PYNaNH2lhm61BfWAj973rwy/vRAHRrDqZHnp5VR+CQ1XSfVV7Agaro
	 Aod8aqmrK6ccA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] mfd: tps65217: Fix NULL pointer dereference on
 IRQ init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002113624.178588-2-r.zhambakiev@prosoftsystems.ru>
References: <20261002113624.178588-1-r.zhambakiev@prosoftsystems.ru>
 <20261002113624.178588-2-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:44:19 +0000
Message-Id: <20261002114419.A203E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
>=20
> tps65217_probe() ignores the return value of tps65217_irq_init(), so
> when the irq domain creation fails the probe still completes and the
> driver ends up bound with a NULL tps->irq_domain. Unloading the
> module then makes tps65217_remove() call irq_domain_remove() on the
> NULL pointer and oops the kernel. On top of that, irq_find_mapping()
> may fall back to the default irq domain and dispose of mappings that
> belong to other interrupt controllers.
>=20
> Check the return value and abort the probe on failure so the error
> is reported and no inconsistent state is left for removal.
>=20
> Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002113624.1785=
88-1-r.zhambakiev@prosoftsystems.ru?part=3D1

