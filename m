Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034256;
	b=D5Ox0oiwwsvm+I+58r4BqpnR1Pls4pmvSwBzYs8XW9pCUDwxTQEOj3N55fhmfnzfsaNj
	 080wyvPme/YRRfmRrAAt8O2c/IcETVNA6MLXxbshewUt/a7hTPxbnuM3rytE2wQs98eUw
	 IPv4s15oxWiZNEuL3EwK+WZWJECNK628GqoB2pnrcmmait6AVbFRGj9hisHtJadDpc9ZQ
	 yOlsE/V2wr1l9zwWrIs7FZ8QGqrek5ggjWfIRXOQ42LvASJEDN+PzFWG+Z50eSRi5N277
	 A5wCX9cDYpjiqcNich8B3Q41c4yRU3ZTT/iXAYvKYvTqjeRR9/gNDqEObPn1/4JRAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034256;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=PWpsvCUXip1i7rOauGAcv+trD2oASaN/jyJ5WLgGFpI=;
	b=L8J6jxyNBOjaY/uP155/O4cDxBkSYylU6kjtAGqtj4frjQ8UE6SUdpyPFb2yrAiSGu2y
	 PNIZ+eGVRLQ4ZYt5VN/PQ6/iwvbgnmLlD1ixtHynMsMvW5WKZgUrpG0sMYblagn7keCpM
	 xhTVJrtwwG0JMev7l43CEhtJST5EdEuwuKpqYqAnQ2FRWj+zzQ2Ksng/0r7HiF11hDewP
	 PwH/ZnDJ8X+0bb4SunvVuWRwuRytujcZ9M0dL8lOY6CwXo7UdySMEr+OdQ3IswRyPeCnP
	 HX+xQO3oymwjk9BDmTFTBMOnydGyDkx0fGNJtzkHN3/8fFUGdQqMeBDeIGgxdzElMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYrVXwAS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B615606A325;
	Wed, 18 Nov 2026 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYrVXwAS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE941F000C4;
	Wed, 18 Nov 2026 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034256;
	bh=PWpsvCUXip1i7rOauGAcv+trD2oASaN/jyJ5WLgGFpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CYrVXwASYcM3Mv9qg26gjZOaVK97z+ZRJcWmQfTaDMhvw1S5s22X/y1GeicizsOwj
	 q+6ZzQVZcM+pfBo8Ek9As/p3AZvy+qQRfMTclKbAQMcUr9GErvk9x/3eLziA9L4xas
	 aAgizqTFQpO5146iBWPHaMubnotEMcaLExsF05sgQtf2w9KiiGiJ0xIyVWXRbEapIc
	 /a8nN4q8FAIfNOMcIA2NgOQ5dyTYXew3xcK/B5CcVNsd4jKZejBYS5+VJjx+pnLRZP
	 42kK8mQhyr56u2/Fqr07IeqZuyk0O0ikgNVlHk/qywM0oV25QiV7wK7DFattepsJEu
	 ZNPeVykBFolHg==
Date: Wed, 18 Nov 2026 20:37:32 +0000
From: Lee Jones <lee@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: mfd@lists.linux.dev, tharvey@gateworks.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: gateworks-gsc: Propagate I2C read errors
Message-ID: <179442103029.44545.1262285836401934201@kernel.org>
References: <202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn>
X-AI-Review-Draft: <202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn>

On Mon, 09 Nov 2026, shao.mingyin@zte.com.cn wrote:

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> gsc_read() retries the I2C transfer but then stores "ret & 0xff" in *val
> and returns 0 even when the transfer failed.  regmap_read() therefore
> never reports an error, so the FW_VER check in gsc_probe() and the two
> GSC_FW_CRC checks that this patch adds are dead code, and on a failed
> read the firmware revision is built from the low byte of the negative
> errno.
>
> Return the error from gsc_read() before touching *val, so regmap_read()
> and its callers see the failure; the FW_VER check and the two CRC checks
> then work as intended.
>
> Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> This supersedes 5/5 of the RESEND series; 1/5-4/5 are unchanged.
>
> v3:
>   - reword the commit message: the two GSC_FW_CRC checks are added by this
>     patch, so say that instead of referring to "the previous version"; the
>     second paragraph no longer calls them pre-existing.  No code change
> v2: https://lore.kernel.org/all/20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn/
> v1: https://lore.kernel.org/all/20261107162125044ldKkwYPQxZOTWg6IDe_LX@zte.com.cn/
>
> diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
> --- a/drivers/mfd/gateworks-gsc.c
> +++ b/drivers/mfd/gateworks-gsc.c
> @@ -62,7 +62,10 @@ int gsc_read(void *context, unsigned int reg, unsigned int *val)
>  		if (ret != -EAGAIN && ret != -EIO)
>  			break;
>  	}
> -	*val = ret & 0xff;
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ret;
>
>  	return 0;
>  }
> @@ -219,9 +222,11 @@ static int gsc_probe(struct i2c_client *client)
>  		return -EIO;
>  	gsc->fwver = reg;
>
> -	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
> +	if (regmap_read(gsc->regmap, GSC_FW_CRC, &reg))
> +		return -EIO;

Should we propagate the return value of regmap_read()?

Also, really not a fan of functions in if()s.

>  	gsc->fwcrc = reg;
> -	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
> +	if (regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg))
> +		return -EIO;
>  	gsc->fwcrc |= reg << 8;
>
>  	gsc->i2c_hwmon = devm_i2c_new_dummy_device(dev, client->adapter,
> -- 
> 2.47.0

-- 
Lee Jones
