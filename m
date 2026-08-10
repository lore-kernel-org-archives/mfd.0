Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B71531E8;
	Mon, 10 Aug 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345884; cv=none; b=EbStNl/4BluW3hP26TOLRVGeblhx/OOGx7kGBFZZ/86FWmkbOq+YLRR+yf1kDmBIdv6VoO9OaIJrGqkoh5W+s+NnLvhHxhno56dRrAxwB2U7NstiQ6bBCdVXZMXUYw/Oj8CQLdKTxyYnPFCpQcfn9X7c4GNAKLrT05PBG4jOhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345884; c=relaxed/simple;
	bh=lW3zJJwLmzYDz5SFrMRO3XErykbKpFqesISfjZ2rsuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ORXIWQvBv5oGeUwNltXWjfL6e7F+0bmUS6IU8hsGbQD0BUnIQHhPHDvNdfFMH15OY/2TDd/wmM3+BcO5UzlgZjXVnDHiiStWgUNF20w61VRxLqQRNVyH/oU8taf2hI9tq+PEo4vRzfvCgQpLDNE8CJENwevRx/m6+NQ0JrgDT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ubc3TEJG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ubc3TEJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C581F000E9;
	Mon, 10 Aug 2026 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345883;
	bh=lW3zJJwLmzYDz5SFrMRO3XErykbKpFqesISfjZ2rsuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ubc3TEJGwmUVtKWNOXJG9ks8hHqYK2ETOPGK35NKB9ZGEIKdlBcqQpbha+C2Weql6
	 lR2B3ebAkuHB4tZ7nPZp8iBTogA64/0yrvssQVde1QthZ71T6EWBh7kjYYu3v6vnbQ
	 azNw6farn4DCn4VzWae2P4eJOsFcsJSSy5UhbyBaB8HYT63ilesJvSU27l0Ff8kIms
	 o6WyfBwa+N+XU0hog3kTUFYzl8NZ9VTpS4f57f8zFy+OcItmtRY3khRO4XR7d/6MFQ
	 4gwI6eq3RVpMLLymaN5gYsY9QS0NiijEsESzrDhR51m3rptILv9XbOWkR5w3yI7prr
	 J0f7v8C95S6OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, lee@kernel.org, vkoul@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810070311.1110849-1-stefandoesinger@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810070311.1110849-1-stefandoesinger@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:11:22 +0000
Message-Id: <20260810071122.91C581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This makes use of the driver added in the previous patches. It wires up
> the uart clocks and resets and allows getting rid of the placeholder
> uartclk node.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D12

