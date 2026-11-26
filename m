Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724295;
	b=tKiObUvouFG6joBVD9VTXwe68Qifgw0Eaqqs1zOGILDZ4G+zUi1aZ0FwR7ywZF1QwRga
	 B4opvy26zygtbEYKqIHLsyy8mcoA6G8ewuzJVEpaTobbykHE9jaRLZo/KIj9iZCoh+SUn
	 Abf0gjHmt/QAp2szSUpVEgxGE0rdKklaF2AR40lfMXXI3r7xHB8F08QRMTIfKP8RjlxqZ
	 YuWW3aVcpUmdpok5Rflqh/X5iQ9Q6vMbUCyLO/j8km+UcsmV5KYLjSAxIDrPSaQVRUnea
	 EIljtuBJ+fGbTCLHuuo1Tr2gZhC/GH06WRmn98V/XVC+RSZIVuYOZVT6AFb5v7Xgbkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724295;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1FnAhgk25xC5O2y7bub24VBFft3zUQeuPp/u1EKgXxw=;
	b=VOSum49uYiu+g2ioQ1vn0i4XmQBM5IMaafxVomYE1WhJ5x6XVivGkjnHOymThgPA8WwB
	 DLJsT53LLNk1m9ur5c5/yi2RLLXGtFqDOkCK/RNQiyPwPMtxTakmkL4A9fESuFD0Q3L2W
	 u1cdurwxQ0oFN4/9r+6XjI0DcQ80pKrPTr5CRS9pHUfAuynVNcPHTcELvOEUD1gRwFJTs
	 WP2MuK60oPaquqnLvyArfYZsT6kKUDDL84qMwXLhLydrBGwua7F21UWqZdxl+RJZFPKkO
	 MpkXnebGq1nOxpT6N2jd0blUEUpcDgDRlunhjtQHLAznvV2vjb+hUsRKAnkSkb0UxMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PYEqj8d1;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D9606A321
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 20:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PYEqj8d1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD1A74E417B6;
	Thu, 26 Nov 2026 20:18:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A688B60558;
	Thu, 26 Nov 2026 20:18:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51DBE11E691C1;
	Thu, 26 Nov 2026 21:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795724290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1FnAhgk25xC5O2y7bub24VBFft3zUQeuPp/u1EKgXxw=;
	b=PYEqj8d1Z4cjlTJyqbx6x6NReRTDGkqobrnpgMgNXsj/PxnD23ArEKGvVu4GvLEs10R3Dd
	sdNgVKJ1BxwRNJdFuflLTv8LN4k+U4Ws/ku9Tyeug89YC4jJkrQn15686F8/1Y38MvazTY
	+eymYI/8QWu6miCpxsMeumUpC9qWw1UjTBgsJ6C7TGsNbwbAUzNsa3T8+t9fN1SY4b1pmo
	CYgLjKGjL7igA2uTrPbXqep6iZ6ly9sAbSE4MN57BV6e4jEz0aBo8DIWM8/sxVQSm7nIdp
	Mq1+1bz5+47Df4uEUxYD9v/lkqpnZN5KUy3OiA6lr4zCGU1FFHUrDyy5uQS0nQ==
Message-ID: <b0d32861-c123-4f4f-8bac-aa0e7e48c719@bootlin.com>
Date: Thu, 26 Nov 2026 21:18:07 +0100
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: cgbc: Fetch the status of a write transfer
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Markus Haberlander <markus.haberlander@rosenberger.com>
References: <20261123-cgbc-i2c-write-status-v1-1-5b0fa0322b57@rosenberger.com>
 <179568834099.302193.16315749597111506309.b4-review@b4>
 <awgwO98qx3zX4MaY@zenone.zhora.eu>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <awgwO98qx3zX4MaY@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 2:14 PM, Andi Shyti wrote:
> Hi Thomas and Markus,
> 
>>> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
>>> index dfdb9ffc6447..2361591a1e31 100644
>>> --- a/drivers/i2c/busses/i2c-cgbc.c
>>> +++ b/drivers/i2c/busses/i2c-cgbc.c
>>> @@ -254,6 +254,22 @@ static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
>>>  		ret = cgbc_command(cgbc, &cmd, cmd_len, NULL, 0, NULL);
>>>  		if (ret)
>>>  			goto err;
>>> +
>>> +		ret = read_poll_timeout(cgbc_i2c_get_status, status,
>>> +					status != CGBC_I2C_STAT_BUSY, 0,
>>> +					2 * algo_data->read_maxtime_us, false, adap);
> 
> would it make sense use USEC_PER_SEC here to preserve the
> existing one-second timeout between write chunks?
read_maxtime_us was computed based on the bus frequency and the maximum
amount of data that can be read by one transfer.
CGBC_I2C_WRITE_MAX_LEN is 32 whereas CGBC_I2C_READ_MAX_LEN is 31, but
multiplied by 2 we should be safe.

If I'm not mistaken, USEC_PER_SEC is only used if master_xfer returns
-EGAIN (arbitration loss), else __i2c_transfer() directly returns so no
1s timeout. And we never return -EAGAIN.

So why should we wait 1s?

Maybe I did not get your point.

Best Regards,
Thomas
