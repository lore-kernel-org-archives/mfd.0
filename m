Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639141;
	b=297KIJUXSJaxJmOUTJ3Rd/GODk5T6sGIJunKkf6HVApdJAX2v946UNPiHOAKpkpqBT95
	 nh8PuuqyYb4id7Ubw9dbjMFffupGVRkSiKRbdkM0pU1YaM3sfFCWzjQ5eX8yxdGu6m2Ue
	 PrmkrwNpqcdn7OBIoKPQwlV46lUGBr2OJUcryLxFJe6L+qKZWW3oobdcK0l43QrTcU9SI
	 vcW1ZbkgxWXDUPTxgKFB0doaFRJTOGwe0IrnOe076bwJ1YOPsOiRoYL3whMQdYLQnyLWH
	 M/ZafUftgd6btHMLnmudK3bq/CykpXpCngH5iV1fFmAu8MIzNvgaMWqmerueT+xLgKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E5TsINuo+d/ne8AiNPnSBDoofcagxdx9s+ITBMZr7nc=;
	b=0CJhx7b7em8s5jpQ8tXFImsVDe8fbm4tuesZHNJ22K7tn/+tY79c3CvPB5LdGST8zuRH
	 UzlSr/rdir88cmkM30jn3FyD061TjlT4ch9Lo8GFjEKfPld4aXLvb3Ta3ZPA69+b8oMrI
	 q/1/WkCbUCwhCqO++x+zVIOoxkmLTuI2TbHVHg7YR6rn6SuuPloAmXbclbm4eiubqQ5c8
	 GBM/jFODuSubZuH/EIvhjF1IusL3fAHwYzch7tzKx1eiZTDnSSJY7LtHdoYey57LlKwhw
	 9C2pX4QFIJF+r2huwDuurHUnxwEpFbsGEb4Ww9hUwB5K5orFeS8t/fKGNMVqqa/Gljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2FvbaON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646A606A909
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2FvbaON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98B01F00A1F;
	Mon,  2 Nov 2026 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639141;
	bh=E5TsINuo+d/ne8AiNPnSBDoofcagxdx9s+ITBMZr7nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2FvbaON8p+N9OvM91H976x48vwWKlrBX0uscoEcjEGNMh3QRFOCza11kxgKiZPW+
	 pgGqsywtqokVURj9co9SsKZkJqAdoVDtqWYijPBZk9P9a7riU3mlCzCKGfNyjIB/JT
	 jWierd32KZxljZdTtJukeWU1TKWg6yfXPLmy6r1TdZsKjXxBmiDi+KFW+XRCQvNRL2
	 QG/DZM1aWx0DwuuZjKJsuVAg2SaJ9IT/VQBbJgROxBl92HbrauxS7wkTw31JZA4FBf
	 wbUMzEE9fvccyW0okIfMPb5HIOw4CyF8etykJPbbeCJfp9/Czxd0NIOU1p1NqC2fQJ
	 UwcCFMT4939CQ==
Message-ID: <sashiko-outbox-193797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>
References: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
 <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:05:40 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.
>=20
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102164157.4010=
002-1-ckeepax@opensource.cirrus.com?part=3D2

