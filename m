Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750264;
	b=jLXzpZl/Yec2eWk94/VlAp31RWRXXSZ3LqhV1IV6Fgr/ACpAs8ukJx/jiqw0N3L5pe3L
	 zjwdYYpnXE6ep+aJ8PcBT31nI5x2t7iC71uKVHUE/n5BDtYNifYC7YS+ufbxQRJBmpB3v
	 PVE6Vgp7L3MbwTUZ4TUZNLWefSfVPNugJMZj4oLPJBg47EM9cFZ6rFURojytnP7BpXCHM
	 gc5s5jORp5tUuomf8gTKxVmPA7YzDUerPM8aODyp+E1ujh/WsJpRxbK5Lt8I+k99s4Hnc
	 ogWWgIH6ByBAW6271UFVJdYJjdn+TQeGp9YH/JLjwJCKresBAuT3KqXWDPTBL6kIuHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750264;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AXj4IcYFs0Yg5Oek3IptIqzvtUl3o2iBPXKgtBhciaM=;
	b=eEepM0vvBkZDIqsauullCzok9QyhQFeHqc3tDJNK9RpGpCToYAzxHzi/V1/HG18ZBdYt
	 kW3ngleouTjI7qPAriqyBU+1fispTb5sUrth9i2VMKo4NMulHysoxmJs7lQds0zfC3qKm
	 YRKplbZBkxZdvqCWSLbPD4flWajJWZV0ZUqhwOKmUautE5E8x9JahSZeR/HzuiKE64QlI
	 uJUCEht0vl8Ww8//UYUGifKrVD8jo1jYReiDHt7GSr8CgASrguKfSWZ5DXktlW+Q5i/hj
	 2E2XQSZABdUisN9xfrFDMdKj1v6Cj6z3jGTx1RBHtW0w6VIVeK2iURg0sraKqS0FA3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JQiX/IJZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94F606A31B
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQiX/IJZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032701F01825;
	Fri, 23 Oct 2026 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750264;
	bh=AXj4IcYFs0Yg5Oek3IptIqzvtUl3o2iBPXKgtBhciaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQiX/IJZv/Xxg5FI9a0wzsL2qLF3AozbPdu3YwbIhcnGtQAMlC5fM7GAK5odq+M0l
	 C0lbbBPVDj7beyTRrCs2ftPiaBnGdgMvUlSV/jcJobw7EeTXnrCFUwIpxAyllgkeby
	 0qfHDXjROtL8tKefIr1tz7kXeAqofw3Fpk5ObCd6L0t8NQz7eh6SaVWhslFAVRnmMa
	 LPi8PhxLkKCEGOZZR5w1zYJMQDEoJ2gf9nPAxuWWhe5c6UAvbxRUXUq7QHfmV+0Vm4
	 BthGdYJVd3d+83IY/UbICM/X2HNRZSjqdLX/4FEE4y2z58mGWpQ1Fz96FgY8E+uks/
	 AqsjDXWfQIuuA==
Message-ID: <sashiko-outbox-182658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261023100401.67592-2-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-2-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:11:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The AXP2101's interrupt line is optional, as for the AXP313A and the
> AXP15060: the driver then registers only the regulators. It has no DCDC
> frequency setting.
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023100401.6759=
2-1-olivier@mgcrea.io?part=3D1

