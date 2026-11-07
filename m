Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794095619;
	b=o+3ZabzsWsWcRA4Grp3SQrKY+bPHyYfH1zqcQYo21xZTaNo9PbrbZeFhzcWez+gR24eA
	 FnhmrNUuHzcc/Z0onLQCpluBMyfi/O9fOndJP9GfUKuE6bmu47eOqquTlbrMJNENLOW7F
	 Z9KBkjKcnfq+3BoP7g0ZZJRLYZaqefELfNanPmb7M6Ie00c0aAwrpS6x2N6Kp5O6kaEb4
	 LKY9QmakrgJTPz1KA+7MP5o2uFs/msl9Mq6uDSNQBEqkvw48m5cvjQwx9UTJ3HeHJqbcx
	 nNMRYdkZ12wwVthvyLPUbmXtmpM/muQboacxOnS3Oo58nmeVNN9YnhXjuMhvZ1VpoUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794095619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
	b=m7ols+qdRGRzbbkNikhj6IdMXC6cCrhRMI7JZJGK3wo3GtBaeXq4k7LtlmoTHYUE1jNi
	 17JfYyVTriyiE0NP6w9k/b5yjPYL2YH0NuLMprCnLdCsEOJ8EiX0biEt4DWxs60Y4cZmx
	 Kidzj7jRo7oyXHy/4+876bYbfQdKrkvet5aS6o3YrRKJlcJHtAjLGoOA9yMhvkzB3u2fW
	 uCBBw5snf7JpY3trQS2aa3atUiONnHOH42BZrwZoUr+7H4VnhilKpZo8Q1V5D2YduyMk0
	 H5FuFG4c9jk1hXyE6tYBLXWkCRhpzih3rHbKhGBOs36Mb2Wu63S4mRytUwD7hwN+Vgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgQeD+Bh;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB4F606A330
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 23:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB4F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgQeD+Bh
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d7791b00so793655ad.0
        for <mfd@lists.linux.dev>; Sat, 07 Nov 2026 15:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794095619; x=1794700419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
        b=fgQeD+BhRGCtdsyplsc9KPp1tB0MFo6Wdkhkylv57IJyK/kmuV5JcqwpL2NfDKMtFj
         V42ctYKeLQLciS+Q/hqy7WumchEsf6NXJXhVVo7Pju21zcNjk1wRJ5aMhd60Z+b/5KMN
         4JG/kj5RtJFH2UTCvrPOLvIzJ59xIPpLAyE4wxt8k86Decu7miSkHtp9ZSZUdqL0CDhK
         xHKsu9oFZQaH3D42mBZpYJuNOq/6GV8itFmMM3wmU6TDmOSKuBG9Ta7YHXu55N5LvJnb
         0K2AlVxrnj47mjUvJcNKZEPJ1rL81KNURcLeI5qekD5QDmkERdupKW4FKPerC1LBv/pF
         nMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095619; x=1794700419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHl7FjLAzlF40pqV1aBsWmS/0qukI7VrjXFs4bBB8lA=;
        b=ZVkG5RPCiH/x01ggRDfQBdMZAqAlRQppgDSZT5YuudtiCPtOqnyO2eRejy2yOOD3hk
         9SkSWlKu4IlT+sALLBAMLknFRX/H5NKd5HH+6rQFUqbDuDZAfovzQI60KIwWeB6Mwfxg
         KzqCe5eCxqtbxzwZWDFzeLCZvCra6P7EiE5sywN3a46U3QjLhLb+9S0HFlJoKvPXdqtR
         kLvtGEhXF3R1F/50pGQQnM3lo1Xdhe5fWqueV2pN080Fk5Y7xBP2yN5Ga7TG8DHa/94s
         mWNJxJot2N830kUZ5rI436tEDldRRMfTR3YwOBzovNY9P9bnBiFVm1SRMSR8AigTRmrn
         S2pA==
X-Forwarded-Encrypted: i=1; AL+hErFZlu0vBqvQnv51alpYCaNlCjjGu40kPgIf9j7YkTOPpXmnAOpLaq59+uGG+HIfUvoPw8E=@lists.linux.dev
X-Gm-Message-State: APuU4Z/udWBwqpAS1pmAfiLtRRSS3VAiaI/oCS8ZWX4A6QA5mpPoL7oL
	kjNT1djoLrgR0EyGF0aymEWFINV1eDrmPGnlmtl3ysZA4+0riLpwwRylqnI2eLHQtg==
X-Gm-Gg: AYBFou1UyjvW2ioSKueisE7YujdMfT5M2SXgZVhVqLDzn+L4NEwKIHht4qCyKH2jhm+
	/EYkoUWKzrpC3U8cWknLvZWiYYPV4aBOfMK2MCR1A3iwXYU9a66yckI5UvtY0nxR8nPE0qNWSfo
	fExFrIRam1CBGFFshhMVcNna3+NHrFtQfq+Cqe1V7r5TTICiEpYxmkxDGfayXn6tIS/iJc5f2Nn
	bswB6B3WFiezktpmqneWgPovjzGTXkzfEPeZhIumPHe7dcRJzVbQCfTQVpKHLHoV5vGPDYfRASx
	4GVwvY/bSLrUuXvU1SsVp1JG1K8LHmCV+JHJtnwfmEzKL7VkI7xxtKU8M1yFAhafhk5kl+AK7w8
	ZpKvKI21BeRNnulBnjols8PkJY0A1d405vaB3vta2//u86Hw/nbZbI4NABnuDJ5umToQIHefVkW
	voCMH5TxiqV8D08mYhAnabcWxvu0HiAQT618I0rrhA8lNGNHn1LIzToeT0b1Uz9n2+96droh94p
	kcGsiepeMfR3YWRiJSdXzn8VeE45guVBHa65JZh7cwMzc1TCOmagDMHzp6vU1IGSZNBXno9ozjp
	vf8HVpQ7uzmdw0zhB67NSuBQnhbLf9kGaVS0oObkcJw1ePCrBbLWY/O9OwA2UsioMPmDK+Z/Dez
	bpyVTcNQHTnxBkTL6WOjX26IJct2xeXTo48cvIUWT3Q86JAGlO6Za75ZuT+vrZhpo9vV2n3ju2S
	D2Q1i4oQSz
X-Received: by 2002:a17:90a:df0d:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3b12d0e72e1mr64263a91.1.1794095617777;
        Sat, 07 Nov 2026 15:53:37 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712bd7sm678574a91.2.2026.11.07.15.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:53:36 -0800 (PST)
Date: Sat, 7 Nov 2026 23:53:33 +0000
From: Benson Leung <bleung@google.com>
To: Daniel Balint <dbalint@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
	Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of
 ec_params_pwrmon
Message-ID: <au-5_dDwdf0j7kDi@google.com>
References: <20261106193129.43493-1-dbalint@google.com>
 <20261106193129.43493-2-dbalint@google.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVqnLzRLk3+00m3z"
Content-Disposition: inline
In-Reply-To: <20261106193129.43493-2-dbalint@google.com>


--SVqnLzRLk3+00m3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 07:31:15PM +0000, Daniel Balint wrote:
> Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
> explicit reserved padding to struct ec_params_pwrmon (2-byte union
> alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
> as __ec_align2 and __ec_align4 expand to __packed in Linux.
>=20
> Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header =
with EC")
> Signed-off-by: Daniel Balint <dbalint@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  include/linux/platform_data/cros_ec_commands.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index a7bd69d83522..6d74371c7074 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -6635,6 +6635,7 @@ enum ec_pwrmon_cmd {
> =20
>  struct ec_params_pwrmon {
>  	uint8_t cmd;
> +	uint8_t reserved;
>  	union {
>  		uint16_t set_rate;
>  		uint8_t channel_id;
> @@ -6651,6 +6652,7 @@ struct ec_params_pwrmon {
>  struct pwrmon_dump_info {
>  	uint8_t channel_id;
>  	char channel_name[32];
> +	uint8_t reserved[3];
>  } __ec_align4;
> =20
>  struct ec_response_pwrmon {
> --=20
> 2.56.0.455.g6c5a503b38-goog
>=20

--SVqnLzRLk3+00m3z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCau+58gAKCRBzbaomhzOw
wupqAQD31+MHMT2GMHa+8gZvTeOGQWK/Ucg+s4hL5AvoDdccuAD9GxQ4UPJP/cxM
xa6kW3kvabTLe+wjpkqkA9kC7jHj2Ao=
=kCAn
-----END PGP SIGNATURE-----

--SVqnLzRLk3+00m3z--
