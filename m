Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250204;
	b=rV9ANtAf6MCetEcQQjeuOVvMoeexGaVuk3VUt5brwsmbIOSD0bHF3zG0A6oc1gfXrxCB
	 8q+6SwF0GusA1eA8yrH5usoSfEywBX6x7ubxZo2TrD46jfFWYHei120+41zNNRHvux3Lk
	 LLZFMT6WkdoHCCZB0bKY/ua0vVW+9hY6wpXP1DoIS06PX/3VYbfc66l9kt3nUtT+owgSH
	 mlbOWLmI/u5nAVdDApMKWUdQfyXs33oT0ITui9Qmn5NA7RF4QG0ThMVzHZNtaEG4IByGC
	 30M3fiQ4Nj1OHrTDImKDx3ZZ73hP3ECWdy+hB3DZWb9yTEhBhJn+kOkXQDjAM4HMoAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MxPeSl7+mILrHGHQsAyferazoOTGnIgjiIHdw44EaM4=;
	b=GfUFdPX7e2q2MSJUNvDJOykwh/Vot0OJSl/GFQz/pP+2uoW4L3GEsH1k4TN9xodzU4j/
	 GhtJ5F2olWFIY0J8HqwEUfs9m6Yxc8bCc5tHyEHqk/2D7/sfrggkWsSspipvFGccIuWPh
	 CaUe22CJhvETnrr/7O5b2NLPTARnXBFwHRLkP59pANZW/eR2BL1zYp6KH5TSlhVa17YJ6
	 uTtwp/3XXJswOqUjRHp3YUKLjKrqEmzzEZ1jNOTbtcnKiJ0m73DTb5UXmeyp1lf85Knmk
	 MFFBSjUiM9LP7CFKtVhs2dT1trM9/Ujn9KqoJ2Vsqo50zBXdMPB10hwMX4R3xmUVAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/U2gL42";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AD606A338
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/U2gL42
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09521F008BE;
	Mon,  9 Nov 2026 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250203;
	bh=MxPeSl7+mILrHGHQsAyferazoOTGnIgjiIHdw44EaM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/U2gL42UTBUoZpN9bqSEbMuvlv7BW+Pubmu29ROT9LH3R3IEgWfM7HbTKH0Ys1iy
	 PlQmbujgyIlyYDiWl0V//+6xUwqPS34Y3AMZsruJgXbcUAcw7FOEg+ofLrElPBoOko
	 bypPSG9gVVuQS1a27LYR+cu4eIqAvtmZjcpdVSXDQM4XmPRKGqxMr/FMI10zSRAJFw
	 rMXnZ55eWYTwFTmhLjr338ItICV2xxkBjSxvK8CF4JC1AsZ/yw9X7YE4nreEJRUXSU
	 K4wjm6K13jq57SE1D4WsEBRpWnOzd0ZIC8c5AXqGP26tF3HOIT35D7Dy9SOJcsq1i4
	 Sw+NJjcLqFA8g==
Message-ID: <sashiko-outbox-205442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Add gpio-hog nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109184654.462128-1-robh@kernel.org>
References: <20261109184654.462128-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:50:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Some Maxim max77620 users define gpio-hog nodes, so add support for them =
in
> the schema.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109184654.4621=
28-1-robh@kernel.org?part=3D1

