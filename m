Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D375D3D566D
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365729; cv=none; b=rkBnoBdQ6H3xO/3Lu5HQhn43Xw05uRJ6MQWItmymgQ8FxksYsFWZPGxcFieHQKpjFHzlSU1sCwHEsU9S/Mf8nQEpnzyeU5GMThz5BTgJzls+lrXneL39NosVoZsriwszGej8GbA0APn4sknxzAnhPtsyYLMxBCogMUaL9Rs5Jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365729; c=relaxed/simple;
	bh=7P8kFX0pfIyJbiHiVoa4nNa4y6FLja6XkpDG6Wb5q8w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JfRYevAFB/GH8vEBd25WXO4Txd1FDabnTVjdi5okG9Qux/Ir6qfv1/KnTHSkJXt0KiLAhqfvGt+I3Un2vj6JkbKZqiP772SWmAxD3LtCmjg9kdtglo+64kvNBBDs0mGHxVv03BnHDtgfTSLOucELjLlxQBqbMaTO9DL8JC19I0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkJtjPpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkJtjPpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB3E1F0089B;
	Wed,  7 Oct 2026 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365719;
	bh=7P8kFX0pfIyJbiHiVoa4nNa4y6FLja6XkpDG6Wb5q8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JkJtjPpc91pT6aMNOKa1+V09f+u7JaNiEpTg4pEvoaVE6STs/7hw5buGQ5PIlalhk
	 7Wg9MOL86SDFCbv8c+EpgSYZMNAz5H3Ni+yK5SURXq7AvL8oKMQouhql3/1BumkyW6
	 PlZk9N6evcwqdZABk32t445OoIdZR3vz+qvmOmnMKhwMWdX2K+4KSbk8JQt8xWlxwL
	 r9GMuw9QteAbtuDxqXy+qbQOm3A5i8QCDomSltFWlO5qvF/eBI/gQY/6ZqKxfE9XNR
	 XxXNP68DMRI5TxYnbhh09JztdbkfzYhQMbjZJLg1SA1uW6whyB60GFFGvJIbJbBK61
	 AMUjgkDx8h+/w==
Message-ID: <sashiko-outbox-162801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/13] mfd: nct6694: Ignore interrupts without a
 mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261007092102.3768818-5-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:35:18 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The return value of irq_find_mapping() is passed straight to
> generic_handle_irq_safe(). If the device reports a hardware interrupt
> that has no mapping, irq_find_mapping() returns 0 and the handler of
> the system's IRQ 0 is invoked instead.
>=20
> Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
> interrupts.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D4

