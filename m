Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333736;
	b=mHjViuO0bZJeuzjpVHYeP13vG0LBOMJ77s5BXcA5EyD4mkvZ3xeT9/NP69MwOYS0bpVR
	 Kbwes/PLgd9J1dE9aleAAWQKu4BwQxtTCSsl+sY/XMc7Pr9ACbDL4RdSBQSzfuI6nr/ue
	 GhX2F2p0cJMAsrPTsdxjHqG0nXC9zPmyVx7/ZkTeqUUmqR912ndQ5bAIyCezv4dK0nSU2
	 Cj6bCWx2PhpROLZ9Ef1l2Du5Omn4oVmL04tz8O90cbqKpAjS4OSUFds86AWXxGr13FaiM
	 7f4mZ6xh6rQr1Kq+ZA5haa/dyJz3MZYD2Q3UURnEyAnsBdMr9LTiuXvip5VTgnbd9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333736;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aN1BWkmgvL2mieNYZzCxXvOnznsCVASIHf97p4cRljw=;
	b=kawjoOZr5rEA/eEYOxjn7N55/30p43ZlzRJYvJNu1U6j5oKbYcKGXdiusF6MT1HNqD8G
	 f6NWqbt2zzBeh4/FKlhfE4WuvqBs3+IovhOrCcL2XiPh52VZihLYidcUKgkVDVbNfLDzL
	 L0IJfzAWrkCZDZI4vsOd9/dqyc0A50ASqYcuwfq/QesBGaIXvm61seGQSQAJtsr0w97YO
	 0u9TljKr7P9qJOYnqwH5LuTtBdKqblmDIHHnUh84NTndwrzy4g41zp36ej7Zg7F7ONkvC
	 kQcauWhe0hZqityWvMZtGV+Kbu5UYJ3QAFbmDWq1nz85Yerj8a2dDSMztzZBuv2w1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiM1tNF8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F53606A33A
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiM1tNF8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FE21F008A5;
	Tue, 10 Nov 2026 18:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333735;
	bh=aN1BWkmgvL2mieNYZzCxXvOnznsCVASIHf97p4cRljw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TiM1tNF8tyxKRVnC7wemBi5C+rhb41zhn1Iev3kqLHbt+VodUKOno34Pe5Z6kA8F2
	 3CkXdLPr7a2CiMy+it2TGZHA7WPpr3AKrs0KHiq4kyQbvhQFkzbrdMn39vP4sqnHBb
	 yIiXo3CMPm+DyJovy7O3h72aG3xuwipfv0hQTuJ2Ync/wjUbN7gJO5UjtOyFqTdIF0
	 b784NkcKQzhXyyyfqgiEBPoXDH7IY1C7NM+leWzq+ppPrPgSHXW6s0K/KWhCFJ0VNA
	 S4nO3RwOYVMHFpKAh87H87k/PAW5TVmw8m9PiO7DsWJGV3Taaz2Hp7z++LvK2+k4E1
	 dJUYqiZIrnOtA==
Message-ID: <sashiko-outbox-207550@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] pinctrl: airoha: add support of an7589 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-8-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-8-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:02:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add pin controller support for the Airoha AN7589. Its GPIO block is
> the EN7581 one with a third bank, giving 74 GPIOs. Pin functions are
> selected through a separate IOMUX block holding a 4 bit mode per pin,
> where mode 0 is GPIO.
>=20
> As on the EN7581, the pwm function is available on GPIO0 to GPIO15
> through the GPIO flash mode register.
>=20
> Unlike on the other SoCs, the pull and drive registers of the AN7589
> are not known, so no pull or drive configuration is provided.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D7

