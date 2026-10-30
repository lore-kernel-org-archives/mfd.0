Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379423;
	b=aGFDzxWQZwhEol7cQh5XVtR9r+vpb8kO7nkqPg9tzs0Vldx9EdzsyXmqRKgb+qJbLGQo
	 4kNEySKjfkEkIXJqggyvsaICtEacNgVEsHIkpa6b/ygZOh0U2gBWDshTwOujYMGyWEMT8
	 fkjAVELCGrxDSJWscxLcYKpBC3VM5zZtr1iFjruGI4doxVwTs2Sn1DrmSDVWvJYnl/ati
	 Dx5Yg6PKMN8ySLxbSfpUfHyyZ+PODdnBHo4pNtiK20/J9cSNbGbbV5/668d6dwuahCfUK
	 5hu0ehBY13uJ8co4UPIx+JN+z4C+HKQ5QdwUc/8DHCBqEfgUQKRbKxGvRZYurXI+sSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379423;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n8a2HV2AJeLostkvdyhQBgmMwhF1tLUFbqFU3INXhG4=;
	b=UA3SaJHdYCililiIvUJLa5NgLmnGGmapkKW+9/O5Yblelt7tflhkdOTI9lEZTxYnv+f8
	 etY1tj3wVQ40XoagPQgswPPTabS7lud1ozerScSRwzAmwLj6i21r8C45T9+/qb3CUKi50
	 2ppE6A8xXi7S8tA1tX62OAZt0ogCgHLeTY0SuNAf1UMdoRR+0ScD+499lXKAkBIwRyJRf
	 q6VsjrK+suwSxyGsTzmvv2PFUgvXYtgdpV6/X2AKoZWyy7lAqeP9+zntuHundu2/K4HdA
	 OoRsxiERiNPyhjqHSuUSN0TkCBc5zWzsKeipgtFnuXn9yG+DuotZyHPjIs4fKl1Yc9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA8FEStQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853C606A31C
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA8FEStQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318BA1F000C1;
	Fri, 30 Oct 2026 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379422;
	bh=n8a2HV2AJeLostkvdyhQBgmMwhF1tLUFbqFU3INXhG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LA8FEStQhuwDYrBCGCM7OzTUh8Hb8ZCKCErefRJFsjkci7eBRih3XWCs/N28o4PRY
	 VIbvwhJNTUIQDpCmTq2oOXY6y4sHRK0j7hXiPDEaPjRv/gHuTpgCoxI8b3beIDWgx2
	 sO/BZ88zqAUEECCN38HXcKcH5hIMLgZyEF8wu0+JFSUaoIi06sq/WF3wEVx1otiAkC
	 +YhgB0ioCgPp2N92CkC1iNemm5asCaXWDA1bSuoPS7m2RmChW+P43EtymQKXQOT5IM
	 /T4h3wgF/2H45vCKuEoyfwiCS0wIS5ZWti2fwPag7emML16tdrrN+Ahnpk1IbnWDep
	 F6GwaDS6r6fjQ==
Message-ID: <sashiko-outbox-191290@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] mfd: atc260x: Fix potential use-after-free on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <344536111bef51c4ee95740e2e17af26ca26929e.1793377422.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <344536111bef51c4ee95740e2e17af26ca26929e.1793377422.git.liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 16:57:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The IRQ chip is device-managed, but the child registration failure path
> also deletes it explicitly. Subsequent devres cleanup can then access
> the freed IRQ-chip data. Let devres perform the IRQ-chip teardown.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: f7cb7fe34db9 ("mfd: Add MFD driver for ATC260x PMICs")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793377422.mf=
d.git.liguangshuo@mail.sdu.edu.cn?part=3D2

