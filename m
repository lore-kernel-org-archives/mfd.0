Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DB518122
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027208; cv=none; b=mbCbxccrKu2v656eq+DhW30OYAcJ314NjyROFf9WbrYrTS7Q8408H/RWlcoeSBlXf1ZDF3qtMsP8ZUzbRfofOQYt1d/Oni6eTp2JIPGM8GtYY5928+cVclokCw9dR07jCOof2F6F6wQ71uien75K5QU8aerv5gNziuWd7nZbqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027208; c=relaxed/simple;
	bh=Yc5Uc7ZFw+ABZqHHGfrsDtaZfnUyH0lPgtl/XXBBFbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdgkS6oIwXoNJssKzHgoEZa4lIbrnpBDMYpLw5KDCziYOt/i6fhsgO6oMX0JdntPPdPKjpXu6d47xJR8x7jTiryLZdMVNyJdJ1IhAkORrVLqa/NI9x97s8t9pPN9O7Wk9Ow1SpSB9inFwW+tM8/eDSxoVjMqRgMcJynGmxyUnAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EsUhHzaU; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EsUhHzaU"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd6so287228485a.3
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790027204; x=1790632004; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZyT8k12LGsI6T36jz5Fg5RlaOjRcJ/zSXFiTQ+h2nQ=;
        b=EsUhHzaUoCFed0mPdVtmzBH2QgujiRkka8aG6uEINC5HikT9R07LdceiCYAQ5Q27nf
         VpdTwxP00g/nkO5DlNvYafoWJ9IXEJr63aHLMrYJ1xhk358c0MSMejCHZ3xWl8bqxU3w
         NPYhgt1X7wRXCLLsb2AVmNgroAOzQFgOKO2rHTZNLH/Y0Tkal/VIxTfjBi4wVBRx4HNF
         31Bb7OCbloqR7qrmgW9OnFEG6rDBIMBNy/pw0FFfkuXra8B4QkGVHKlDazX8xsLkSYbH
         fn3GtyHdFy5NSgHBPDfdAFak0hyWOh5yNh6ikeAV+GfDdkjtqZsNIdK/isnBke6AWwO5
         uIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027204; x=1790632004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZyT8k12LGsI6T36jz5Fg5RlaOjRcJ/zSXFiTQ+h2nQ=;
        b=AHJImEWF5Sn88YWHuUS5FnTxzKH20KKXpZHuJ1HBDFfPq8VsQAuA9w9yC7sSb8zDns
         MklPWEthEAMEeb+fBke1f9/XHCqfWsf8JlPzDsrQ+eHiqMRiLCj/G9MqNCkIEGLG/kR+
         Z6KduBgJVnx+VjBvIg9g29bYwpH17r6CC8zioMHxTVpefF9WPNPez8i2THgkhgnUGYQ3
         GnAnfm7porpgVRhs1ApcuTEx5a7oevVsTxdqhwpBEwrHBcqStHyA76Ef7SrKlAvvwncT
         2M4PfAwwvEGPn1fskaaCN5iZSWY+t8oXeo1giB/iYS30WsrQpVGQjCqb52SYt7uyXTB4
         AwOg==
X-Forwarded-Encrypted: i=1; AKwUvBwy1DBXifwZnEJbRRE1Vuo5rRVWdYQ1Ef/9sjiV5W192/aRNrTXaF3i+PUwmmE6F5XgCJM=@lists.linux.dev
X-Gm-Message-State: AFuF++nL4JlbFJ+aIBITzVBhfJoUWHLfIohKBJj7VRENqiEX6+CMZ/IU
	rb6Whbfz7rkWuamlSDNlrnPdnTDyCr3jMqUIXPCnicpc5iC6DC7sVFzweVGGJ97D+k4=
X-Gm-Gg: AYBFou0gstXKa/1KLiRyw3lXaa8SjxoTLrvGuU8+YzwvnZDuo18gD7XK+W8kZlbFGDa
	gZCjGagICqLITZXlzqy2Tr2N25/HeD+uwVv5+npQllad3wIbuQU5xn1v1QpFlQeZODNHO69yE54
	oETuoXGxzjwTs8Iam3kV4GwJwlCKY0rJZO1afvKmCYpycWXfY32mrdS+cr4tqh8hfcLOsuZpfHJ
	7AriXnjYe7U4s+VuVyqtxaSLXra63qB30C7ACO+ofcN3BXvyij+2Jf9yvdJvoUS44WUF033ebuG
	HkguGYzO/bcXWn9gyV2K2lmHinYjr6hmcJBjhZLI5ZnNyui4ARLg8V7wONjUw1OwTV80J5CxK08
	PYqTp6FK0N0DHOgKKGA8ISCxFjV+FGQaFinF/3axuR5W0J2+AHA7cXZNVT4Jwqez+UMcGBWhpXq
	YGuV/jXd5bDGRbHUKGaDRERtkY4T5iyGhfV7ZW2C4/vGocEKPa7nAnXyfTQHtRskiN89ScTVc=
X-Received: by 2002:a05:620a:4496:b0:93b:d7d7:8739 with SMTP id af79cd13be357-93c15e4296bmr271488185a.46.1790027203515;
        Mon, 21 Sep 2026 14:46:43 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a604dasm24653985a.11.2026.09.21.14.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:46:43 -0700 (PDT)
Message-ID: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Date: Mon, 21 Sep 2026 16:46:41 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260920-fiery-fanatic-manticore-6abf0a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 1:18 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 18, 2026 at 11:52:30AM -0500, Alex Elder wrote:
>> Define the binding for a system controller used in the Toshiba
>> TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

Thank you for your feedback, Krzysztof.

>> ---
>>   .../bindings/mfd/toshiba,tc9564.yaml          | 56 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
>> new file mode 100644
>> index 0000000000000..32e73a727c82a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/toshiba,tc9564.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 System Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK.

>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch includes
>> +  an embedded PCIe endpoint on one of its downstream ports that provides
>> +  access to various SoC peripherals (including a clock and reset controller)
>> +  via one of its BARs.  A system controller provides managed access to the
>> +  first two pages of this memory region to ensure accesses made by these
>> +  peripherals produce well-defined results.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: toshiba,tc9564-config
>> +      - const: syscon
>> +      - const: simple-mfd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ranges: true
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
> 
> Both properties and simple-mfd are redundant. You do not have children.

I think ranges, #address-cells, and #size-cells might have
been left here by mistake, and I hadn't noticed.  (They are
required to be included within a pci-ep-bus sub-node, but
even if that's why they're here, they're in the wrong place.)

I will remove these three properties, as well as the
"simple-mfd" compatible string in version 2.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
> 
> And this should be additionalProperties instead

OK.
>> +examples:
>> +  - |
>> +    syscon@0 {
>> +        compatible = "toshiba,tc9564-config",
>> +                     "syscon",
>> +                     "simple-mfd";
>> +        reg = <0x0 0x2000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
> 
> As you can see here - no children.

I have seen some examples of syscon nodes that incorporate
sub-devices, while others do not.

Our purpose for defining a syscon here is to coordinate
access for multiple devices to several registers located
within the same page of memory.

I think this device was originally defined in a sub-node
because the only memory accesses it requires are within
the range covered by the syscon.

Should we instead define the syscon to be a fairly trivial
standalone thing, and then refer to it in the clock/reset
device node by phandle?  (Or have the driver look it up
by compatible string?)

     tc9564_config_syscon0: syscon@0 {
         compatible = "toshiba,tc9564-config",
                      "syscon";
         reg = <0x0 0x2000>;
     };

     clock@1004 {
         compatible = "toshiba,tc9564-clock";
         toshiba,config-syscon = <&tc9564_config_syscon0 0x1004>;
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
> I also have doubts that this is needed - I see no updates to the misc
> binding, which would be referencing it. But then another point would be,
> that you do not need separate child node, which has no properties.

I'm sorry if I'm missing something.  I saw other examples of
syscon nodes being defined, and tried to copy what I saw, but
obviously got it wrong.

> Well, has one - address space.
> 
> Lack of full picture is not helping here.

I will gladly provide a better picture, but I also want to
stay focused on what's necessary for the binding.

I have more in my next message.

					-Alex

> Best regards,
> Krzysztof

