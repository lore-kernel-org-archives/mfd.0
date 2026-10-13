Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822AC37A83D
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874107; cv=none; b=VsM7/BIoVbckJyoVMn1ssIECl2tFCAVI77VOivAYPtwLef1RT2O15NCcPX1sbejKdUugQ93qNb6k5+Bi+W1OEmUoXvyWf6Vr47l0r5SWYqgzEzz9VhsUMvBRR+f3jPg5XmRRvKzkJ+DSyJp9sQe1PAp/ixbayTdc6jd0Mxn0ZCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874107; c=relaxed/simple;
	bh=beeeNr7lja4HRudfzCyUoO33kra7yn3MBqUmesQZsqE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=F67a1Isi2qQjqL1DxVVYITjMRImA0Tk6BLAkfQ4JzmzuAP4AiCz9rM9a8Z3NyfA6xfbNG0m2C9Hba6U9DFSDa66iLpxchmAsWBRwgYlpBv4peAmKFz2prmiBCi5oqBWQcDnL3oKLAsP38ZSRaZAR+CA85Z1WmEG7oycrBLlf5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHF3Xy1W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHF3Xy1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2F61F000FF;
	Tue, 13 Oct 2026 06:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874106;
	bh=beeeNr7lja4HRudfzCyUoO33kra7yn3MBqUmesQZsqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHF3Xy1W6IfA2Q8nJT/sTMXwxNFLtK+JUNcW8u3huHyfpyFLI+7iuzYQxL/oPyNsE
	 C4FK5PbS68DueD96ZxTqRca71rS8bfabiYAtUPA0D1zt+8IlLTAqXwhe2utAJLdbtg
	 6HK+WRxNCKvz5FQr8yXkR9k7+0oexm2vKIKshIxiwduf1tN6mqtKZYbQrEf2ExrEEA
	 lfJ7LhfxG4adcC0yLM2AlR4gRzsKdkkOhQ1z+FrNst27Oa4f6ZIoG3jh3BTi8TczAw
	 hky82brdrj4e2LyvLxtISyGblcLh8Igi5N37UUfOiPcXBWoo7tBzxKb0I+rqgnChJI
	 JxJejQ7RpPGWg==
Message-ID: <sashiko-outbox-169134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/12] mfd: nct6694: Ignore interrupts without a
 mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-4-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-4-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:48:25 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D3

