Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428687;
	b=1FD+SByqL5inLYRDvLsZw4SXj1n++1ZDA2qKd0TCV9chrp5UIzc1QwErSXSreaLAhovs
	 G6gk2ih0KjS5QCNSYjxX63tupYLLwnk+MOeKy3fPEkfwhnFfj0lV9yMAucw1kLsVsoCXV
	 3A/tEfmhPgv9s3B/qogg3uf6N4d9uh1WQvVTvEfLH/aGjeNccjK+mwDUxluKTfuEIuBjL
	 Tax1h/a2ahVHHRKo+kAb0sBLxVaBPJD/hWJuySsGY/331JH3xUK5l4G8cCGGEGatvh1Yu
	 FS6UbmnZbV+XwhSzc36fzwjZQDm20JL853zITN6LZvRvs9Np67A/d56euafOrtOtTuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KAk00XwOqSOgiYIPzBRhIle4Ushj7gxtc26c6ryd28g=;
	b=gBm4WrBE+8oHToNKe2561bDJV+5ar5KommrnItZYMFMXf9Hua1PZok9yzEBqUDxPBFH6
	 lOiYrKYzRY6sZYYnWTFGrAWkuuSptd08BBOrLk2DxWWwzK029RZLlVzSs+EWS02MpeGV6
	 wX/n80zmG8gaQxnsDrWIhUYI8Yp3Hv9mtVcSLATaGSw8gLbH2nNZOl08yHDzSOSFx+BOm
	 q34iNjHWy2PzpJPEsVqKhtvKzbAR8QtE+W1osyTgUPCQzhdEbYQem9IlIJra1L6hwMArJ
	 VDrywq6NASDcLNjcu0oT/R+zIXAPuuGqf+B7lUF1z1LZs0WXprnpLx/GSlDzMUFI7rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avtudjZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51212606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avtudjZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EF11F00A05;
	Wed, 11 Nov 2026 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428686;
	bh=KAk00XwOqSOgiYIPzBRhIle4Ushj7gxtc26c6ryd28g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avtudjZjmsViCBqZBSeqwmuh8XJ/y7l1i3Mlelikl8Fc4BAPGaBAa2NZ5zYV4FSHf
	 EuLcSubaJzRQ7K00b0JEH/s8GsXb+wWUyslOkONyB0K8DDsp2ptk5EDNNsghO6dIG6
	 PI3Q1Bk8mr/wMF58Im7lz2GZn2pTwuaE6kdAumek72nUuJFR/2psqco1UNF5Rfc6Ap
	 +CIGTpKXmOCNNpeRJduXfWz+4FvziPhAthl5TfTAUlHk8l/ZWHshke6MGg+S0ZafgS
	 rNlovlj+MC6bK/Zks5hvJNYq7H2JlzfXrHfMXARMUG4kkFRxE79tcsVp3CbeKY7GcA
	 yrvSI1TEd/Lsg==
Message-ID: <sashiko-outbox-209649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/12] arm64: dts: hisilicon: hip05: Rename the HIP05
 NOR flash node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-7-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-7-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:24:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Correct the HIP05 flash node name to be the documented 'flash' rather than
> 'nor-flash'.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D7

