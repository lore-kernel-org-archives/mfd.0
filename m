Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170844499BD
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629643; cv=none; b=GwRWKXTOm/DdOkkVaJ6/loUSwDHaqBE/ABt0j5okWuXt8Ru4XK0/Q7rZpxc2YvNukKbD8gamYRnv4vOdjubkAMxIzsw2oODYUBjH1B8wOKjfD2UvGgcOw/wd1+hHDJd7dkigeuEpjJgzURTjArhIf6L1tl40ih241WYVca2mqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629643; c=relaxed/simple;
	bh=s3/Onw72S9dk93eCRqLYcz1O1NY3X9ekRePWFirb7LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZGrPuE+TEfjy/vbJcICusVG2QpWMkjHIObcuqNMfX14WZCNCugq2N5IocNGW7rQ6yAKThJrMpdX5XYcp66FhVn+ZFWOoAgZmIYgidaNaDg20lWkabcg7Wryx40MpOvAGfGlyzP8uD+NSi+QNMKaIuLwB7/14QKuOgl/HnLIjVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L53K0oat; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L53K0oat"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476d8e647e9so346504f8f.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783629640; x=1784234440; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3/Onw72S9dk93eCRqLYcz1O1NY3X9ekRePWFirb7LE=;
        b=L53K0oat8Q4tERwNe0h9IhMYYxA9qAAEoHJis/mQc1jXW5dmwxOTaDbIxL3/kv+wzH
         +Am+0a6Jelm6RuE/sCqpU2L5MBEVKuVbaKjsp2MA496yCT5G/F1oULWKKVRr/+fnHX/0
         NF3MxGOUPKX8yWBiNSncoY8ALAbEgN54tDnllsH7lyNxWGs6GlqZp1r2Gy5IQQCNEb/H
         ZzbPcfO4mogsl6tDXdxtgmka+CbgD6HP9Pzus3WU7YrWtinBQI3Tc7UsWOH15FuiCqio
         ZZg/gT5/7jDGn8doAGInQVYznC1ACjJ0tBdKtLV3kwcPC26s5/jlr7ygEarim7hJFICr
         2iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629640; x=1784234440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3/Onw72S9dk93eCRqLYcz1O1NY3X9ekRePWFirb7LE=;
        b=BEs7bT9rXQhrcYCL0v1nlJa8dUMmlUTuQg0yNl5evVR1YGe0gBb/aMzT6VSQ94yHCS
         1uoSh90cN6WkrVBw8Lv5HOjuWIMBFOnwPHKn48RrKqSC6KNNRmgVd8ddee7fbBK0iNaZ
         NqofOI3VH+BbWPj3yuexGob5jeZF6m1bQd+d/RbV6FWx1tbFepkD2Q8JS0KVcTHqX45A
         Lariz8vdD+Q2dGGsiCtTkZbBQlSR1rNAytEkUQ40RQFk7lwHZNvNmxaKteCecJoxbSTd
         Y+0Mb0WNYkw2AjaWHQ3T8HVlXCMopy52lKiKOK80vLlsYhIcKHSk9THFw8I7a5zBl5Uy
         lDQA==
X-Gm-Message-State: AOJu0YwuQbr66EHKn3TnG0WorlwlNZeGMXgIE+fsKHv/16Y55m5P7qI6
	kicfPT9exVgBdOfs/7/hzsw0fMIb24NlVuTiNeKHCqhefmxgbzCvBMgVFMHz6boZOso=
X-Gm-Gg: AfdE7cmC1DB0X9S2psJ/dxGH1eRqN3U65/Pp4Fxv7J+IobL9GHrXQmkXBCITPHRux2g
	St8woeAzWHBgmC1KXdFh5WV0o8AITb9aJyj5NAm6DW8F2CddC4iKmMDHroPOxw/RY1DZD0q9e19
	VM8aUOhPDOFBgv4YF1CvBRXZXGZ1Pe41hS5bI0h3ajzH9EJc/v2FhNLxyP8aNQWV3XQii4+GR75
	kZdn3au0oKKJEzS97zcW6sRGPczoVpFi/eDx2AChjT3ncY/M6xCQU+EpYbKrtOS94HsD9i9xHQw
	RZFsPBSZ6xamLIWrN50F429N6VPWmaA7B4x0fsmcbPNrmhAGtpjBVq52DQqA7maYl6VtAysuWDv
	7T8KfUrsh9RxFnQrPIhAafBl3B3Gqrh09cTowcjtEfrv3fbs2rL2NZGei8uZEq64QQrB2vzZq2I
	7Ppmq+d6P8f5iWeLzBow==
X-Received: by 2002:a05:6000:4b04:b0:47e:9f03:e542 with SMTP id ffacd0b85a97d-47e9f03e597mr1591471f8f.45.1783629640468;
        Thu, 09 Jul 2026 13:40:40 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ae44sm51629344f8f.23.2026.07.09.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:40:39 -0700 (PDT)
Date: Thu, 9 Jul 2026 22:40:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH v3 10/23] mfd: Drop unused assignment of spi_device_id
 driver data
Message-ID: <alAGbQ3y3oO5L8av@monoceros>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <0f1fd857e1b34e69f83fbc784b10d2dc608b2494.1783615311.git.u.kleine-koenig@baylibre.com>
 <20260709170902.5BD381F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tlslylt5cxycfent"
Content-Disposition: inline
In-Reply-To: <20260709170902.5BD381F00A3D@smtp.kernel.org>


--tlslylt5cxycfent
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 10/23] mfd: Drop unused assignment of spi_device_id
 driver data
MIME-Version: 1.0

Hello,

On Thu, Jul 09, 2026 at 05:09:01PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> This isn't a bug, but does the commit message subject omit the mandatory
> driver name component?

As before, I think this isn't justified. The patch touches three drivers
below drivers/mfd, so there is no unique driver name component.

Best regards
Uwe

--tlslylt5cxycfent
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQB0MACgkQj4D7WH0S
/k6kpAf9EeakYkLHNwsQ+OLp7eYfuwMapxmCF989pKRpwo9r3VMjEXsRzM0ybBty
+c+Hr7yDhElPZt5JbaaZv0dtc11y3Ostnl0Em/05QDWCoW+bQLpqPvD0ZFoPtGuR
Neebp6Ddjg331srQiKNWyQoVFMfk/c4lMoGwBeObZ1fm+vLVr35Nb5njP1ba0M6X
Y7adP1KR5ejsmU8o6hlgjrilSFM/TfuOuW/gR+DOiPTNORBIJllLYExHc1IbDu4t
x7r8s3DKD3l0loqeDAXgzrTwUAjoQoBepKN73bnxolObcrj4pQSXfYRMN4cTSkzO
o3L/kJCCeFivOORca7CRhM/bCw/Fbw==
=Xn5u
-----END PGP SIGNATURE-----

--tlslylt5cxycfent--
