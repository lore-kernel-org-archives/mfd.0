Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428935;
	b=wQd3U3OIO7iQSilfszlCTi1oyEWRcJo2vUb4A2ryoP2FbC/NPGKXSJBZaJnarM/KMrWf
	 ibRznFOiq8hVwYR33V6V8udwVr0FyHr0Azivykfzk1S3seksiXpzF3I6i8XU++gwuiPmb
	 1iK1ezUFb6l/6vxcQLhVbW/TnvvauJjecaYAgrvOaGvM8ZuAu6YR/ixKcz8k7pVG4VdYE
	 O/y22Y8UrshmnC9VCG07IsXyy1LSiNNK3FRg9oYgUg4i5Ez6K6QpjH+MuKcVl0OOQmRYv
	 wHpZ+CLHxdvS+W4PggjB5zj1vTOk6iAZVf9P+n9xOdZPZJIPCXP4/nsDINjsINhR8iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=klaKuL1LMOufzcWMnZcm2ybwpbokrsN8hGs+uyM4atE=;
	b=Xsjih10I/0eIA22nVPzUqEXoc5R2Y4r9B+6FwyGacJ9FsB5u+Fi0C4YVVqMnDYfuBFnP
	 jPABc1v2nJLTTF7YTbNUdbOh/m1AsxkYvkZ73bP6NpbfIRmYfHg+2ExLQETs7fQufPkW+
	 /Q8V7Hzi5QrJUqE31rliyn1XB/Fv7IMb3bMpqHvdoATDB19dbHnJ3tGM3nXIOiZn6BAmw
	 OzYvty3KO8IUaSH34qcLngCfv3Zz1fJuaZBFbYoQeCNsermOb2blwQ9ILg5jLY8whT0sj
	 io1yvfxlrRFs4+2BStFTmDbF4AqIQtNF4vN4JpCpXo4LjwWVkz6AtmK6VQjWnAWkPPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtw+Vzn4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DA606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtw+Vzn4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498261F00A05;
	Wed, 11 Nov 2026 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428935;
	bh=klaKuL1LMOufzcWMnZcm2ybwpbokrsN8hGs+uyM4atE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mtw+Vzn4q6kbPGlnfHL+yYpGwthKT0nBOA3/IOJRdAuMuzJ5XbKdeJniNsr7dZMLL
	 TQfZgOlqwzsFZhJR4ln2houH45mtFkpNccirLd0FgIvG9f8D+L/ZxJqpwReKanmpWw
	 aSkwmIXarCi1nAdVuOI6KSLhpLA6KsKfWhJvUX0UqzSn/6zSAZrBZ23CNOvv8gZ9oh
	 EwxjEAP6k889XD/YalAXxSimeByBjVneXVg7AAAvIdGjPKc38TEflZ7LqL4/I3A3B8
	 JJpD3QDn1EF5Db8eF9CVQV1LbGIG3Dol10ghc+3wT0dsfq3zfsqcsKxRN36BNt9meX
	 KZBmb1IdZMKlg==
Message-ID: <sashiko-outbox-209666@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] arm64: dts: hisilicon: Remove unsupported SBSA
 UART "reg-io-width"
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-12-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-12-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:28:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The SBSA UART driver uses 4 byte access width by default and
> "reg-io-width" is not supported in the binding, so drop it.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D12

