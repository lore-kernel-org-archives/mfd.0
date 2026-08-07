Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD521CFE0;
	Fri,  7 Aug 2026 01:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065951; cv=none; b=eG13J96Q4yz+PAXi8zy0TlIqtNYotiCEHaO96nK+mFsosPU8d54LyNUImtT1y+f/6MIzcmQM46Z/BS7W9GeZGHfzkHUzprcZPt8TN4rTjta2x5Y7bSOw36mY5qaDKL5pQJzCd16nYpr3KVkDONab0ZQSx5n+Ish3sWIqWjeP5xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065951; c=relaxed/simple;
	bh=PwE6QOUJ1Aa2oF3yotqiZ/0apZ/D1+EDyG9hSYtyWNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1PmhcFx6KpNoz/ZefbxikC3rCBn7XujbWaSoP8r++GExof9JiD1uRS8kKq/2jueG/F1UhfPUXM0CQ8sDf5kZ61U2hVsWwGyIX1k/WxClPzWckaO5kUJlt88XngUwV6OinsVJQilRQo+tPN2OTmmZL+EPrD6VFwv9Okz4FvHmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pvrk/e5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pvrk/e5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421E61F00A3A;
	Fri,  7 Aug 2026 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786065950;
	bh=PwE6QOUJ1Aa2oF3yotqiZ/0apZ/D1+EDyG9hSYtyWNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pvrk/e5qOB8vfgF82b66GFGV1giklGf2mCaiA0TwOvsw8Eo+BGQWYt8IzAHEocq1J
	 eEnqQz9USrlcnWTtfm727tsrY678kZRyFpQ1N2JMXUTx8gg6CszAXBUW5vyfQySmYQ
	 py+Azmdz9aOtcVeuotxk7SQpe8oLV25MdmsFflltV2+jnh4Ed0Ub42AYEYIKlquX1O
	 zUu+TzwZAHdGZxJg4fMhm19OSSST1EQ3YD0Ale87GUrGS3nFMqIcxMEIjVTwAh4SIJ
	 fa82CZVPAJbg1djrqfBvTQhuIyG4xvoE8BtORw2GK2fN7l3uJVBmJpFto4uNwjZYta
	 EKzwrtLQcxVbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/4] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260805-submit-acx00-of-dynamic-v1-v3-3-32c3210a6f25@gmail.com>
References: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
 <20260805-submit-acx00-of-dynamic-v1-v3-3-32c3210a6f25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 01:25:49 +0000
Message-Id: <20260807012550.421E61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
> report the same Clause 22 identifier and use the same link-side register
> layout. Their package control paths differ: AC200 uses registers in its
> I2C MFD, while the AC300 control range is at a second Clause 22 address
> fixed at 16 plus the link address.
>=20
> Describe both variants as Ethernet PHY packages. The package reg value is
> the link PHY base address and the child supplies the documented PHY ID,
> because the identification registers cannot be read until package setup
> has completed. The AC300 driver reaches its control range with the PHY
> package offset helpers. The AC200 package instead references its MFD.
>=20
> Give fixed hardware variant-specific compatibles. Also provide an ACx00
> compatible for systems which can contain either package, with one packed
> NVMEM field containing calibration in bits 3 through 0, the AC300 selector
> in bit 8 and its low-calibration selector in bit 9. Such a description
> contains the potential resources for both backends; the driver consumes
> only those selected by the configuration field.
>=20
> Describe the package clock, supply and optional xMII receive-clock
> inversion needed by some integrations. A fixed AC200 package may omit the
> NVMEM field and use its internal calibration copy. Limit AC300-capable li=
nk
> addresses to 0 through 7 so the control address remains in the documented
> range 16 through 23.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-submit-acx=
00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com?part=3D3

