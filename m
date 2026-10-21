Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585382;
	b=OzRA03JI53nEY8/HnOD9da9rforLOpOEkQ8iKOg33AzyuJdpwjCir2+QpyzHnhgllaUj
	 kksUZdmF/iPgwmkZ3D/a+n9tO53z0XtCdvOI+yj3MOIRp1UcTCdjEexuCxecZRo1K7aDz
	 o3pYtg3E5ZuxcMtpF3Z2x8h53zh17bFLzGFzm+jyFr36sDeOQDkuxLPh/cEHjZo6wPOoq
	 WGBpZJ9BcSPNt1E0bLy+iaW+NxQHJK6uf1TF1u/2Ik+BGGRHKMhK/x4ZX6CeHjsh9LzpO
	 BFjVz8G69ocm9O1+rPPTg6y/ITYLCAk8fIVgpjP6mg28d8RO/IRJUtInkO5Qmr0Q47w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6XIWLGdI/VNm3CXQCfLB1vRHj5gCTpNdlKJCMGU+8/Q=;
	b=33tsoSuATBVJNqylCazq3iV6uMJ/G7SWWTYKeCNA93QjEUjTlJv4DDmHEanCtfT4wKQ/
	 QesximteV2Ub9FgA+9f7DRWVUcdiiu+ig/00CLFZHhsX4Ois5a9THIeAtlAVFKf2AciSO
	 UpiSerofVN8pNUAaTL6KPPzVtIL9m1j9yGiBB0D1nTAYWX7S+XiPr4JpTh40/1SjaSku6
	 BSI6aUoqY/5sPQ25jhCJJOWlL19BGej91EVtXPPXldxBwdsE+eNW3Zfcyd2pKlJoGWmQd
	 K0fX95at2S01lVmy+rxEX5bhJYlACv8SLVhEykAPQcKyY5a6sAfjxZKI5SLXVeZtNKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UwR0ho/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300AD606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwR0ho/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF3F1F000C4;
	Wed, 21 Oct 2026 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585381;
	bh=6XIWLGdI/VNm3CXQCfLB1vRHj5gCTpNdlKJCMGU+8/Q=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=UwR0ho/T+HbfgCcdGxw2O+chAvDfwwqr1JtU98u4x0SROLkHsPQG148V8FdwbQAwJ
	 XDfAuY6ZWM+SdZHcaW7TUIklJ5SWVonTIFHTFJpq+vMK0mzNqZTcgQQMkQ2wcSIF9p
	 EX17KreVP4vdMQ4e7tnNRXnA/s9NBfEFI/DL749YoIYMh2Y57iS1kZXAJE2XGUP3FA
	 rmpEqD5speM3W3oD6AtoyanOMBlUTI+IXw7UJzAX4lEhTD/WUVPDjLjKRQ5olrCQD4
	 t5Ch5NWHekvzT2h+xLDxTaX1Z60r7vFdtlavl8NiAPsoPn5Jjf1mIX9kcZtwH75KjK
	 Rl86gSw3u5QdQ==
Message-ID: <sashiko-outbox-180239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/28] mfd: db8500-prcmu: Make AB8500 cell and IRQ
 resource static
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-7-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-7-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:23:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
> and the mfd_cell descriptors on the stack and assigns &ab850x_resource
> to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
> resource table via platform_device_add_resources() before
> db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
> attached to the child platform device retains a stale pointer to the
> expired stack frame.
>=20
> Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
> descriptors as static const so the resource pointer remains valid for
> the lifetime of the device.
>=20
> Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4=
c9d
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D7

