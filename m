Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851518;
	b=rySUYDTBxVCqL2ZlqbhuEHrKwHWdLQfQzRWhohJNerXTwTLPy6RJsUBxxO4b/IC6Zagw
	 EhtSyMtfXgnuIBw9rb1QihEF3oJlzb0mt/+QQnt26OVd3Nguk3h9x1ZzVg9dqw61WV6Pz
	 JFoSix5t0z8BEeeZV7dQyUNguXXpgK1eqtG0q38qwBjozA/36+g7A7u9c/syVAYnd4HJ0
	 Fi7F/OAReRhnWVYqtNTxpIlEVyXZ37cpIDV9HUVamWHfYmNu32LBi23K+dpZ7bOGnOjLj
	 4Mq6XibepEneFar4YwPqbNJl5b2VKJ9qD0upucKDGUI17U/hbLXDimLfyWBttDs8HnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zaAKBly/0oSzQLMB1bQ9RJ5e3jmbAIXxzOUIWxG/R50=;
	b=unHBmIOISVgo5Bg/yiTuYfdpLCFCQw/HYl/io9QSQYVdO14bOl47UANBZGJxz07hM6XQ
	 wY9Wk+3nRvA54nQx4pujSkXx+nKBKE4U2Z/q9w2ahGeRq6uPQveZGekKXOzeHmV9tGCEP
	 SmUYIe8Adn7JmKXix0LH6/ixab0SLfbyJfMVHzBsfO8lrUwVy14NZFPOm0vqyERgH/D5j
	 zvvGspAX1UhA3My7Rx7z4kqbdQtf8W4WJhV/HyiDdPt+40XudmT+OqV7b95KVuQWIL2cp
	 PPIefRQ2f6LEg9pEO5MXgY7aW3PHvHDixi2Lx9Ee7aYcdZeQO+idf5I97uvXC596saA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLLXyYeB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10F606A33B
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLLXyYeB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F194D1F000C4;
	Mon, 16 Nov 2026 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851518;
	bh=zaAKBly/0oSzQLMB1bQ9RJ5e3jmbAIXxzOUIWxG/R50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLLXyYeBi/uuBDezAgDJGayWa05PKEPq8HgPmtSMZNkP+ulCiiym8rMBFDLuP/Kme
	 PQiYrfeQya3PKbE3sNwdmZuyBRcyZoAu4JtRoihbgAF8YOz5QkxcJLCKeLHvlgvpYU
	 1mkE5mGhh34zCeKR06LvYWDL9m5YE3T2drBpuoXE6DKLZQ13QQAc+pjiUiNztbljEx
	 74MCYoud0hDYLdKbnT36/aEkRi1qf7OqFbFZe27N74/CqztvkDEXtheyUxUgbJZjhs
	 jeDhUtY17FUmqmZKAN2dxrovLQWzmlljI3tKIzjC7zoC7XYVxrzw9f4Pjscdrq0YQA
	 i9d1+G3ZALYPg==
Message-ID: <sashiko-outbox-217446@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/9] dt-bindings: mfd: syscon: add
 airoha,an7589-iomux
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-6-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-6-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:51:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The Airoha AN7589 IOMUX block holds the 4 bit mode field of each pin.
> The pin controller reaches it through the airoha,iomux phandle. Add it
> to the syscon compatibles.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D5

