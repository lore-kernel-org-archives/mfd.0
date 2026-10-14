Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901A3A4F2C
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971690; cv=none; b=WzzzPnJmEXn9C/LaqHSpeZfSLHxM6xjdXHJwsdR4dgwlGKLtrnukQSlzizy/U2g4Bs5YzjlkRroJqssrIV5OQszv4JFAgiZoNoWvCbkC4x9WzvJV6jiCMRUmWqiYEom7Z6uZFUlSED1iAGL1d1qP2hfpEdULGAfFxxIGvm6Cn9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971690; c=relaxed/simple;
	bh=j1HZ4IRU5FoAbQ8wYtgjAlQvQlivJQ5PzYtv/E8p7B8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ObFV/V8bTyGbgst3UmBpszPNZ0BcKjYvE+jtK1/MdBRwWsvYrBtrmC0rHKDiux7b9BgvqXP1z2tpkpfPfOKyW9qbcAvFNsbXQaNjglb9mpeQlAK6kcSnZyNCChLpDRgglkBFeg8sQijnJjdYWyoJsWN35z9GifRxfbUZOCkn344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XngrRTiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XngrRTiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C661F00893;
	Wed, 14 Oct 2026 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971689;
	bh=j1HZ4IRU5FoAbQ8wYtgjAlQvQlivJQ5PzYtv/E8p7B8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XngrRTiBLvRj7eBq8iT9+2S21UfcBcUSzxGjflB0NCy3jonVTPs4/pUO6Vew3Ni6m
	 ljSBoEcWiJ/DLzrMEfe0HLro/nDPfxppYeQ1AACYP7tSi3fjuJW8j5sTcIFbytYgwn
	 dv8L9Zse+xWen7JCCIxF8KmdXvAuUulf2ipIGsElXUYctwYocysO5qkSZkot/W8wYz
	 aiwmS8Ox0ql1jilUINGqzpm7sDaya48shb1RuFQzYm7/m+CGIN7MZIP2+gz4V3QtbQ
	 dzNV9FPMi3w3xNeHIKNgCf4rp674L2nsAfh/XlKDinsLCW5MhswHQiL6MoWo5hEbmH
	 gLI6PtxNoLw6A==
Message-ID: <sashiko-outbox-171102@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/5] dt-bindings: soc: Describe the BCM6846
 Processor Monitor Bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:54:48 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The third generation Platform Management Controller (PMC3) accesses
> SoC block control registers through the Processor Monitor Bus (PMB).
> Describe the BCM6846 PMB controller and its shared register bank.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-xg6846b-bc=
mbca-xrdp-reset-v1-0-daf5d177e113@kernel.org?part=3D2

