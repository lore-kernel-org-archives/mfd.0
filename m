Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555687;
	b=hR7l+sAgH1+1ZUFgpJIakGm7lyG2aWYgF89SuDbDbD9sF5qSQ9GgiPm563EyAwG3wJ7G
	 tJyiuqpxt0Suv3w5wPw9ku1v+UbDPyqBCPjLvNkeGgsKVPIVij/RK3CAn/8k+gHw2egwG
	 0hpLCQQcMVZcleEtm/NkC3n/FWkuhactSRASpyCZsxQ6pnICnhv4Xqe+pkH7SuS0xHcq5
	 SbHRXd6slBUOkDSYGofEBiSiAstR2ToB+/A4VOib35fo3PWXWqVHxEc0YlZtSo9uhaRns
	 T02wsjLv1zpr4g4hfv2F0ubyMSjfMArP6X+2QpJIOqZXeBW3NqVOZlxCSNyM/URt/XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BdanH7G/SQaEeuvnU7HU1THGMeZ/c1vLuLcbGrFeGoE=;
	b=wpashY2EEW12OkI2frMXrdyUNvEVNfV7UI5XiciMJlyTus83jzKfZAVEAC2+OSfTMpWi
	 sT31lCl620B5kC0bCpodcFMjrw7/i4vcITa/t5oMGu9kofSiRnXj/55jKUwSXOoGAjPFL
	 /AjnlAWLDrAD0QE37m/DPcZZpjl/Sbd7K8eajnNYZWSI+nKRW5Y5bFPMWQkY7CF8PMhVa
	 1nGve5P2A3A45pd3uBiilqwtJwDX1Twes9L8DCCA9mRB3NvlWOZPViRBJeGa+N1jHLhsa
	 RssmyDfntAsVWG3iiZgI/JrX8Mr/lwEXpxT1xos7yEtOoWAxN18KMNVowvuCg4UcZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7Oz37Lj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2066606A324
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7Oz37Lj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D93B1F000C1;
	Sun,  1 Nov 2026 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793555686;
	bh=BdanH7G/SQaEeuvnU7HU1THGMeZ/c1vLuLcbGrFeGoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7Oz37LjkcfljThOqNNAXsfoczIEmEWnped2ekSdeRf/N1qA2vBsFz3v/qxBtTTnK
	 49hyw2MOuyyxpomPSKqXLLQgGJ2z7HUim/D7F3uXpjZASHQJacekeQeXz9aoBPYfun
	 3m0dbngD9twpEohK7lMsvv/6WF584iQtKBzHkJiyH5jv421KXg14wKzBdfvR0HN1lC
	 DNeJ87E0vDVxGrhNhYwKsvZ/Yfkv0CPlfTp/SOu5LjFRuYGQogPyQJnoVo9loCa+8F
	 cBYXUiVVHMaPsfDwGrZC7EiIv/nxKW0l2Q6/hi36zExfC1uzoTNTpcMFQadokhhbQh
	 3gOW0RcU6MmJg==
Message-ID: <sashiko-outbox-192543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: macsmc: Hold the lock while reading key info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuvan Shen" <yuvanshen09@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261101-upstream-macsmc-key-info-v1-1-fa9ff863d199@gmail.com>
References: <20261101-upstream-macsmc-key-info-v1-1-fa9ff863d199@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 17:54:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Yuvan Shen <yuvanshen09@gmail.com>
>=20
> apple_smc_get_key_info() releases the SMC mutex when apple_smc_cmd()
> returns, and only then copies the reply out of the shared memory buffer.
> A command issued by another thread in between can overwrite the buffer,
> so the key's size, type and flags can come from a different reply. The
> hwmon and power sub-devices call it from their probe functions, while
> the other sub-devices may already be issuing commands.
>=20
> Hold the mutex until the reply has been copied, as apple_smc_read() and
> apple_smc_write() do.
>=20
> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuvan Shen <yuvanshen09@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-upstream-m=
acsmc-key-info-v1-1-fa9ff863d199@gmail.com?part=3D1

