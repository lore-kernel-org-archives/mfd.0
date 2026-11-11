Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432265;
	b=toMSOUZwpKK98ICM8Gg491VF7TSFYPYca0nrP8S/MHN/BIUzzVyJErsnxYIHl06NuJW+
	 zBxFcfRxaA0r7GiBaIlTjCx/7se970I/u8UsYtn4XDpWGQxYTwKYPwZYTnbI4E+wYItpN
	 Y+uXw0jaDiqryjIe1yFLM3Z5H8QxrlQaLNbge0ZOlEHfIH2QjQUBsJiv7Yw0Wfenz9Huc
	 PzbOSaTlOfUwfjLNOcU9st+k0q+QIwkBYnnHS2damHDnEBhP/L+4ee8bubLVxCi51JbI6
	 fuIj5jEvEuPw2sqhK7gwiVYSmjjvn9++Dl2z370/wAOp6DKkMTasINeb4Uj/maFYvHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432265;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R53uIW8XrueBRxVl61Lb5/FyDsQTzWRzPVv47py9QsM=;
	b=SlXZtfhpq6lZaxn/G0cc8fud02gZGdYjPNjRBbe3mQLtM3Bqao8ybyNF0dV3KNf7cUPr
	 Nr+vbSxEyOdv5tnksInU7j7n/UCCax7R/fwNNlgQehQZtG5tUh05K8w0fk9WzboHrddTj
	 v1Tq5phFDVdcJTbafyuxRLXoXhYgPjLoG9Fx1P5pLkavYGpziOnDQ1HOXc1FdYy5Hf2uF
	 lmbLbElNq9vEk/bWgbsJJ0bKyCQH3rq+BkREn3MVOdIpgn7qlfJUI5fiCgwhDlU2mrjpN
	 SxfdjXy+cr4EPuyYrsXzyNGVz3yagZmCiPLKMopFyAU0Airse6R2bSE63GF3ugPZokA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wdxn/Id3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884C606A327
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wdxn/Id3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FC01F00A05;
	Wed, 11 Nov 2026 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432265;
	bh=R53uIW8XrueBRxVl61Lb5/FyDsQTzWRzPVv47py9QsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wdxn/Id3fUj0UGwHYmKDov8tjPQs1Lo7/kZ7hjIp1ssgQj21RfiwFgRESCh69JhaB
	 HtR5kgZgp57wGD2jmJ8b6DuJUvIXd7NLdBSaJnOU9ZYd+PzrhnPrRfNVd9SIYPQdwd
	 gqr1b7F2xieWHQzEQkXPZLIpAxDvKbS4bi+B55+uzWZobePhxseKKhpq73M61CgQ83
	 XjvhJ5RtCmVuZc0ZHi2k2y2ze+7B9oQQQIaI5IVSSU+yKxdI/t51W3qDLpDkzeSyT+
	 aGrO/zXbq9AGTACrwfiQvnO+UgNwZuJ5lBd4rgty7abDtU31tcWO11RN5b1OlH9oQ3
	 +M0+Sxma9Ymhg==
Message-ID: <sashiko-outbox-209703@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 5/7] power: supply: rk817-charger: Expose boot
 voltage and OCV values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-6-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:24:24 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Expose PWRON_VOL as POWER_SUPPLY_PROP_VOLTAGE_BOOT and the current
> rested pair as POWER_SUPPLY_PROP_VOLTAGE_OCV. The OCV value will
> return -ENODATA while the battery is not resting.
>=20
> Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D5

