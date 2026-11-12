Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442298;
	b=1JLfr2i9G9E4M5r31cXcLCX2KHHXEfUi4l7T1cyReG90t0dBC7z5s/SSBk3W8YuSvon1
	 f0XNeSB7bP36SZscJzX8Aw/tr0Nj41dwb5I8fmalWfSOde+bZDJkutnTv8D8bqMU8gPpd
	 IQAyxq35MCIXxnvNuvxEppLPFnPs/x5N/v24XG2BsVJSTGp7PJHhiuWooN4tz7z9ghvo6
	 LZw3k62uBmdphefyvSwAfuYl5VpfM8CdqELE+/S2VFOF9qzljGDy4YFjjaYqIgDNPCD4v
	 n4OWgQvVXmjG0MjJoHq44ebO+SCjYfZKH043TRhrmoHKsRQshLXETwNkElzxqwSvvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442298;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eaMVWyg88TTJTbJx6okDLxpyTQxjW4R9AX5COxGE+fw=;
	b=PGlRtYAFh0Qv9+Pv+hM64y2qygHNzbtOTe6YnloM21jnAplyAC5EF9ySoztuJkXjzCPh
	 1QltrxpsJySKVccpCbFJxcZAp0+UvXIzkgXfyNpi6OOfgien3W0Dhu6Hu3Ywp67vFa//e
	 abxk1qOx42ppHoAm2aVfWh5cgYx5NMT+j8OvI5Me4glfUDytsPFw+97WSPPCYbwwb7O/E
	 Ss5MperbC14fRSqpLE42J1owd7iP0DecjwkiBcECIcI//UcUNQ918ZCRmcLwy+T22iFHV
	 jvhp9+kPIZfXdSibbcd0i/NHzY4i9rHv3eip4dr2dxk78vR5IIUgrK/0KVh7E0REKkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VFCqJ2vE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109B606A321
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VFCqJ2vE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12E31F00A05;
	Thu, 12 Nov 2026 00:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442297;
	bh=eaMVWyg88TTJTbJx6okDLxpyTQxjW4R9AX5COxGE+fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VFCqJ2vEUHG/tyW0m6/Lu07gQGHxyWg+od80dSyjiMyLGNQouxM28A5nntcRMhGFg
	 AIbq7iNcE00o6BJpts8bVCLMUVt0bpLg/MKfVtCiXgXXTMzZYvcmr0pQfhUXcYTkt6
	 2iHPmuNC87tofRIv4mUZan13tTe/BN5wq+lSnL4SdaOo3k+OiBuTpnnoVy+MeSXfEY
	 67gCXU+qU6zbV4ccCJEOSMm4opAegZJAdtDyBKygZb9gYrSzicgGRKSdppVSX/Mfsx
	 F7Cj9J4F42/N1n7hzeK79d+s0jrG3qMA7IBQtUzQtvJT+C/nFez1kJFicDvik+tmex
	 IQfn/+aCTDvxg==
Message-ID: <sashiko-outbox-209886@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] arm64: dts: marvell: Drop unused USB 'phy-names'
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-7-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-7-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:11:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> 'phy-names' is not valid without a corresponding 'phys' property, so
> drop them when 'phys' is not present.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D7

