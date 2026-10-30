Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364761;
	b=zigcC984D57U+U2fa6m/y2F7c+2He0P2KGeV+k+fik6tJR64lbx63yPxSylDH79Ao/ph
	 TBUVPGyJ+FOPU7oc3mTzcGAK/vGqKwfzK4+XPhdXCtscaaiYQm6OpzYHr0LllQJS0KDgH
	 2vt8muKPRKFhMtfF6BlnHwoWwgJl8G4dHOPso2PglXoPTjzneNkEP3E7QND2TOPzuqoMl
	 N8Io5/+C76MSYhz2P8zNjto0sXEFCLY9BiZczbbuJanjJxT1oeX+m0LhITPl/6S2wS88a
	 4+CxtjMZnYEpvzN5m4nExkjofxX8zEGHj2oK7ylt+84RH39x2aDKIjruSCh6PzhAlsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364761;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7WPJfSbhJPG+aWfRswgb4X8meRNEv65VCekzNJZEgdQ=;
	b=nFPRYPUDATV6MFyuwz8LzadtZy+F5Qu8uuXdo/v1zc/l8FFdo/DPHD2iicVuC32OPWjj
	 w1FAnmSsEe/iBjFIsv5Sbgg+buAlC7VdTYUJl/B2Bi7Ttn6AQBcpOaD+R900nGR2UgtT4
	 V393kobxmitAPzGGm+0wVFbhNfmKvc7YwtZsYUX26MPlnpVukeC3fsqeXfFdjbc52L0fM
	 YckdsSkBTnHZb3fgMJ+M9pQhrUw4mxOgVr7PNf5XQkL0AaN2VQMRslNn6osDKMLM2hqkf
	 BUUtA5dIOyYkZ0wj8LXKD+aQMrLGEgKrczTXR9iWo1Vxk6FptsFBiDCooRGyYX6djHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=EJ6Wxhwl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M8Ki4xyu;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B029606A31F
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 12:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B029606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=EJ6Wxhwl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M8Ki4xyu
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F407EEC0171
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 08:52:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 30 Oct 2026 08:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793364759;
	 x=1793451159; bh=7WPJfSbhJPG+aWfRswgb4X8meRNEv65VCekzNJZEgdQ=; b=
	EJ6Wxhwlq0a8oCUw+hMwS9ZmVvwf8q3kR57wxxzqeZsKV9Jc1cK0BGhmMKf79HCD
	pjCyai6PmW8Gj+fLWL28xLY+7M+dL/J8xPkqPMCTMRh+8IWCWhLhUmbyoWQFq42x
	ml5vxUONHsLf1Rz2SZoa8masBPtldog7wvrHQOUzgw+bBb1gmx7v4iSr/NqD5brR
	Ty/NRxKSrgrejvhOhooEsDyfAHA5P4OxXvyxvTGeU2O4ArVNLIG2nJBZcJih1fc3
	JCnjYGZUS2sjJN5i992JrBO5p8I/yIXg3n5uBv8KK4c82cZ0zVtv5Ih94O6wuhGF
	CMKvxa/E9N7laMBpfFTyUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793364759; x=
	1793451159; bh=7WPJfSbhJPG+aWfRswgb4X8meRNEv65VCekzNJZEgdQ=; b=M
	8Ki4xyusLVxX3N9luedM9XVDqoDg32QluE4im29uRRddzsM5Veb8Lkt075HmF9J6
	FBAFQuo2uUlJEol2zXb6HP9CnBy6MbUEUGi5IyFlKNZ6//BoFlzPjUdbg2M441IU
	3FnkAoH4xceZ0skxGlJ5t1qELQP2TdxbYUdPefpjGhFZH+xlgcc4y0AZJ4UPXd/3
	USgfie2L06OJcOKO+AU9tI3wnwW70OTrEeGWBPK6XTx37cvinUkxrNzWbnpRkLC5
	jpN4GpX5TxxqDojRDJTmsxBhmpS+vGqizU6onHxrgTiyO6WuGY8x8awMfc8of/x0
	a8pdTTHp8caaAQ4Fnbxwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793364759; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PG1mZEBsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:YfCnG1kzub1TcsbKozCxWC/9VN5gNJfbwoyWgM7pi2zRI0w
	87QziXS1dNhjTlYpqUAy0H1CZtgjIII+n7M5fgtL5FErVTcxH3JoiIUdWB1bWBM/
	QpjYSaKKMwZE3qoPS0vJA20pi4mlUPOV+p1n2KDvxL9tLDe3DhkTZkvvE/y54la4
	3u1fHjPSqnehbcidbeIEi6+iUNhIZV+PBgtLUJAOUKEnhBpxQ0/sJEA4TKjkk3jJ
	ULxRgVvI2QjF7XxDt9oY+vniXigEjNkvPHHqdreYYp5eUA7uwvKVJUnweg0DqKOr
	DVgd93O/cZBChDSfMZGl6/iyPz7/HJ/uArlupJQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uqA22ld/nBFOKHecKlpdBcAHPxvZwg+YiJtUH6rBJfw=:mlG9k5Up7umvFv8xt7upEY+izvTaplLwCETyPuMRe6g=;
X-ME-Sender: <xms:F5Pkan5BefxeB8eiGJ8XU4_zQKjyZNCmDaUMbM3R27I3FFFfJ00Idw>
    <xme:F5PkakfmMWtvAuVIZQy_nVaMSjSQ1t6sRVH9le6P68IIYaUISjNWF_8lOpNmVNB0l
    wKe4QE09W26fyoqhsDRS_vjwNgyzwotnMOId3nIyKg-xngiYW0>
X-ME-Received: <xmr:F5PkauHgQW_C-Qrpw8RoexuEYD_9zqmonFMGC80HloLcoMNimr-wxGYpr9b5Z7dVtfo>
X-ME-Proxy-Cause: dmFkZTFRq5EEQOwx0SGuhY7n37tMaYfEIgICyQXaX3OdgQrHiNFLH9A8Vqzo1dweSr3W+q
    V19ZxeqkSPlM1ADokplcKpJuK3NXk0GSP5eHKHPlA0AB1im8434YIXwX0ukC70Jrecq5YO
    CLCqe9vFAnkQkFX7rYtiXREYaysYMNgjShxClDIVcQND1GkHSBVkmMVKM4aHfxsW1uMlLQ
    zUTz2mI8cDuYY9vlJeLA/eRaUcFojzLFkZYUxoFXWW14gYFXEbC0IdzbFVXnOtvZHopfXG
    JJJC1mOZ4X7lrjhrBcO7Um12Fgz1M5Q1wDL0s2dMFmpfKFTI1pV49/ekHLRmZGaEdrbgn3
    D7yJExbRjgSmBf93MnpAoG+tEc5K4zxONTUa7su/nBf5uvCA5QlEZqfvP/SiTldBQ0obZw
    o0jCDILD7nSl2OzomjJiCgxGpDTm7m4fZF2eDaSviHuV4xgc9eME5IX0DMcwf5Przdk8uY
    fbh/gU4Urk/EClRUammua2BCitNl1YW+K+1bGWavvtP+Acr+DXNbqCHLkz5dt4bPavyoqK
    VfAnvS06L1eXK/biYXwkUw7Gd+pofILfJMQxnUjrBkxCI9Nqj2TVZE4i2lKSSxWWcdz/fO
    A0OPJOZa1uJzWeJRGAgsJqrpIyht5EMtfgYPHqZuZ3MYhxnV5u3aQCYLpWIQ
X-ME-Proxy: <xmx:F5Pkak5FNrDS4BCqxG3fefWtA9-raE-1CNuWfZmplT_Rt8gw5FhSYQ>
    <xmx:F5PkahsemWXyTJnCTNqChU0otOyDU-scxXuEsMetGILNDS_oDr-kPA>
    <xmx:F5Pkao9RqN2vnJZz2gjKOZoeFOBO7qXNLiN16qg3SOH1sH7GUhk84A>
    <xmx:F5PkarlPwUFhL4uPgjUTBG81MWVr5RNfEMKPtR2vgcNto79g2sLZfg>
    <xmx:F5Pkav6iCGFU5qKKOAMoPWpTkOX6nStqH2GuIueg-Ni6lnb4PMQeA1yo>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 08:52:38 -0400 (EDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] backlight: aat2870: Derive brightness steps
 from max current
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261027113230.47538-3-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
 <20261027113230.47538-3-clamor95@gmail.com>
Date: Fri, 30 Oct 2026 13:52:30 +0100
Message-Id: <179336475066.10571.11619253467388579632.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364758; l=370;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=mlG9k5Up7umvFv8xt7upEY+izvTaplLwCETyPuMRe6g=;
 b=AClAE1+sCEWzUXiKS3U3GTpx4k3p2L1m98wLOKukAJTgXXwILpWTkqwRuzTCgrdZ43c4fwi96
 bq1U74IDPH5DB8FGcQpNgqEEj9hVriBX8dANegY96N4huHaVDQho/bq
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Tue, 27 Oct 2026 13:32:28 +0200, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> The AAT2870 allows only 32 steps of brightness, with this amount defined
> by the maximum supported current. Remove the need for max_brightness by
> calculating the allowed number of steps from the maximum current.

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

