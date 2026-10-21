Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585316;
	b=b1T2GaT7EKPSBuo1WZwSZrcy4hEE0XQXhBGtC4EZ7dRGTnVA9ZDcspb3MOZgsHj0SqHD
	 XvtJUZy0Ctmp9iBYM4rRbCpdthKeMuAdoC058xWp3WeSW+uSY8WmfhmVAqvOQ2oYXM9i1
	 FTa24UpdfWbz4x1QuJo5usbWDWS9kfL4AXXgt9HlY0I6cjxJwRB47hX1FMEapBlXxjpc6
	 11psGiWrYMRl7gL0TwwtoVUPMcOKQ5wL5t1VuJdLAaIHUqv3Q88ZG//hrJQ2nBZWg2utF
	 3fOtfSN5zThj09Gffr2cPYz6Q1nYsNOriFb+Ft+oru6vmIHCZ1icqb8DEM0DhMEJdxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585316;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/hnWiNb5Xz2FDu2L65tMKy+ebncH26Jo0Zj13rX0Wko=;
	b=cHbbZVSJbo3fMSlqhRIANP++zJj4R4udx/q0Fix46y7He70057o7hINLsaNOawC2PKuc
	 vFP6SBYS+/4V3zQt6jEIfOqQHxxmApexLNUQn4/3MSf88eAFy8sioA8GEHpBCLJREoGRF
	 dAKhXPSRyQmOXy5ZpmfVF36wQFpEUvlwFBRKcL6KFxsxEMaFczmWdiPkY7IREMCndgCi6
	 YXW17ykx+EnPLZyqLVIxMWLr2jrlN/uGxMu5OXGvIo7ChRtrUSV4gqUB+842crgRGQYx3
	 maiGQBNpScqVEiyZP82ebuIeQOkuH63qWbxeJplgT/PoULX6OckJhnxD/x2VY3kdGpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEQ3eS2D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C38606A31D
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEQ3eS2D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BDC1F000C5;
	Wed, 21 Oct 2026 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585316;
	bh=/hnWiNb5Xz2FDu2L65tMKy+ebncH26Jo0Zj13rX0Wko=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gEQ3eS2Ddd9iSw4WPFQx6moDXx7qV9hcHkqaqs/8v3drTkklyuUVASvUakVe/YKhH
	 0wXPyGmuNXSHO/99KN3docDB7utBhdCbyhwF3sO3i/Ngp1dn18Gr5XbIU8+i0qRbfc
	 r2riMG4T3B3DtD3XJgU/zBngtUmuSDBls6XOlgDDlpEcKve2w6/4ptDyyVfUPG7qjq
	 djsxjEfOYh0Dmm3KzstufhoflSnWLzXhwxSqNRD1p+/4jrZTewF/M2gfb4WSEJYV4+
	 k6oIzdGGTVXjSblhKGrsT03tJL36pEeWV5W5aFVUtpokOrNpfy6JhMamXvRcNyypPH
	 NwHOuG91f8XCA==
Message-ID: <sashiko-outbox-180233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/28] mfd: ls2kbmc: Unregister GPIO GSI via
 devm_add_action_or_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-2-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-2-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:21:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ls2k_bmc_init() unconditionally calls acpi_unregister_gsi() immediately
> after requesting the GPIO interrupt via devm_request_irq().  This
> prematurely disposes of the active IRQ mapping while the interrupt
> handler remains registered, breaking the GPIO watchdog interrupt and
> causing a use-after-free when devres later frees the disposed IRQ
> descriptor on probe failure or device unbind.
>=20
> Register a devm_add_action_or_reset() callback before devm_request_irq()
> so that acpi_unregister_gsi() is invoked only after devres has freed the
> interrupt.
>=20
> Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function su=
pport")
> Closes: https://sashiko.dev/#/bug/linux-cab8bfb6-4077-46f3-a173-ac2e2042c=
f66
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D2

