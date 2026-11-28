Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881099;
	b=rJ0ZwNRGAuz9ms1GiZuh0gxImiFVi2K15A+GOispa9b4VKlaF1wLom7LHzm8pJkPcmmk
	 rrSdIDc6hEeb7RIXEiC3jvVerNJ8ysALUHARXpdk69BmUJlsLZtXvuHEr1eJ/KWTkcqKj
	 7zQ5DDYTnT2YeWTd6LDM94b2Sp7jcTwQWYFvGiOtPTlepo94J2T5rTVKtCbzMMOkB5vWt
	 NJLEPf0LUXjDkUpTmsx6VmwtUUb+QLerUPHxj4m8Bg4dqlGl3FwpdRjFMN8aeqEedgn9y
	 0m23h3Guv2jSBPhiAun6T9pfEkAj7nBoDk57IHXiZSU7z2j7LsNMGNhphgSWPvYNTzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nUlfK3WvmVZje3U8AtlsT/YvRhbZBmWWtXRBrI1rCrY=;
	b=J9H7ielxf0ZIois/0oT1Ck2+UNoRl902H/ehb4c/Q603e0IO29Lv7pkoGaR50jbYop6K
	 22NjsqEQq9H0fkNd75JpVlvCJZWsr1FCB59A64VDAo6cx8WqtVAiBOaRluLvg7jZA0Iz1
	 GSq+yeaiJ83NfXqE41o55MJp/SsR1w3orPMbzV+IW1Jlk/utXHujhHaE3/MJktwCr96b7
	 pbXsmDXT2qH4ynT39qlibwVhmD07o+OKyr4oGX/S92rbXGHSXRaBLi1sSRzUuuQ7BzcYv
	 d3WGnHUPo6Q3yDkGr+QoL5xB8beP1T5cQq3smbfQCORFS3yhCAXxLTg9l+y580zyf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bcFv1/pG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39161606A31C
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bcFv1/pG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE131F000C1;
	Sat, 28 Nov 2026 15:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795881099;
	bh=nUlfK3WvmVZje3U8AtlsT/YvRhbZBmWWtXRBrI1rCrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bcFv1/pGqra/t2YNAcvJmrz3gBWXCep7inYYxyCj9hRA67b6xXoZCkkOG59gub4Dt
	 mbnjzem29rseWTJuS7CQIUWrqo0GXcGjvpAFITXCQzpBG4IEU4BLiW1UR8bfPN4ZMA
	 DNGyjeIT/71CVOy/0j5AAlMVOFrNsTtuLOEwcjwuo1aok+Q3EpH9yVooolkCv1T1M4
	 8+EjtYb8aKWST9DwjasDLjqBqBdc4T5cS2LDhK1hZGqdwUBf49yxMC8EjPDfIJhT8A
	 P8o+1/pCAeK0pAkDWrFOOenA5zytDjo31/OkGNLzw3WLsQeoLeNf+DfzUjJy3erkfr
	 UcK5luZLarJMQ==
Message-ID: <sashiko-outbox-238825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/4] ARM: tegra: Fix warm restarts on Tegra20
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artur Kowalski" <arturkow2000@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 15:51:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 4-patch series:

- Patches 1-3: no issues found.
- Patch 4 ("media: tegra-vde: Drop warm restart workaround"): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-t20-soft-r=
eset-v1-0-0db458c5996b@gmail.com
